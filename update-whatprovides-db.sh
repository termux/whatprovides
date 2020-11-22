#!/usr/bin/env bash
##
## Script that generates or updates a Whatprovides
## database for Termux.
##

set -e -u

: "${TERMUX_PREFIX:="/data/data/com.termux/files/usr"}"

list_files() {
	FILES=$(dpkg-deb --fsys-tarfile "${1}" | tar -t | cut -b2- \
		| xargs -rd\\n realpath -sm --relative-base="$TERMUX_PREFIX" -- \
		| grep -vEx '[./]|/data(/data(/com\.termux(/files)?)?)?')
	SORTKEYS='-k1,1'
	for ((x=2; x<=$(wc -L <<< "${FILES//[^\/$'\n']/}")+1; x++)); do
		SORTKEYS="$SORTKEYS -k$x,$x"
	done
	sort -t/ $SORTKEYS <<< "$FILES" \
		| awk 'NR == 1 { p=$0; next } substr($0, 1, length(p) +1 ) != p"/" { print p } { p=$0 } END { print p }'
}

write_sql_script() {
	local debfile_dir=$1
	local debfile_path

	# SQL statements should be executed within a single
	# transaction, otherwise execution performance would
	# be very slow.
	echo "BEGIN TRANSACTION;" >> "$SQLSCRIPT_TMPFILE"

	while read -r debfile_path; do
		# .deb files are named package-name_version-revision_cpuarch.deb
		local package_name
		package_name=$(basename "$debfile_path" | cut -d_ -f1)

		echo "[*] Processing '${debfile_path}'..." >&2

		# Delete content of processed package to ensure there will not be any
		# duplicates and stale entries.
		echo "DELETE FROM whatprovides WHERE package_name == \"${package_name}\";" >> "$SQLSCRIPT_TMPFILE"

		# Add row with matching package-name and file-name.
		while read -r file_path; do
			echo "${package_name}: adding '${file_path}'" >&2
			echo "INSERT INTO whatprovides (package_name, owned_file) VALUES (\"${package_name}\", \"${file_path}\");" >> "$SQLSCRIPT_TMPFILE"
		done < <(list_files "$debfile_path")
	# Note: searching only for ARCH "all" (platform-independent) and "aarch64" which
	# has 100% support by Termux packages.
	done < <(find "$debfile_dir" -type f \( -name "*_all.deb" -o -name "*_aarch64.deb" \) -print)

	echo "COMMIT;" >> "$SQLSCRIPT_TMPFILE"

	# Databases which were not generated from scratch needs
	# to be compacted.
	echo "VACUUM;" >> "$SQLSCRIPT_TMPFILE"
	echo "REINDEX;" >> "$SQLSCRIPT_TMPFILE"
}

if [ $# -ge 2 ]; then
	SQLSCRIPT_TMPFILE=$(mktemp -t "whatprovides.XXXXXX.sql")

	if [ ! -e "${1}" ]; then
		echo "[*] Creating new database." >&2
		sqlite3 "$1" "CREATE TABLE whatprovides ( id INTEGER PRIMARY KEY, package_name TEXT NOT NULL, owned_file TEXT NOT NULL);"
	fi

	echo "[*] Generating SQL script..." >&2
	write_sql_script "$2" "$SQLSCRIPT_TMPFILE"

	echo "[*] Rebuilding database..." >&2
	sqlite3 "$1" < "$SQLSCRIPT_TMPFILE"

	rm -f "${SQLSCRIPT_TMPFILE}"

	echo "[*] Done." >&2
else
	echo
	echo "Usage: update-whatprovides-db.sh [db path] [directory with .deb files]"
	echo
	echo "Regenerate a database for Termux Whatprovides utility."
	echo
	exit 1
fi
