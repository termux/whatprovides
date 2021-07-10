# Deprecation notice

This project is deprecated in favor of `apt-file` utility. Package `whatprovides` and database file will be removed.

You can install `apt-file` package with next command:
```
pkg install apt-file
```

Depending on Termux version (< 0.118), you may need to fix permission of one file in $PREFIX (known issue):
```
chmod +x $PREFIX/lib/apt/apt-helper
```

Usage example:
```
~ $ apt-file update
~ $ apt-file list termux-tools
termux-tools: /data/data/com.termux/files/usr/bin/chsh
termux-tools: /data/data/com.termux/files/usr/bin/cmd
termux-tools: /data/data/com.termux/files/usr/bin/dalvikvm
termux-tools: /data/data/com.termux/files/usr/bin/df
termux-tools: /data/data/com.termux/files/usr/bin/getprop
termux-tools: /data/data/com.termux/files/usr/bin/ip
termux-tools: /data/data/com.termux/files/usr/bin/logcat
termux-tools: /data/data/com.termux/files/usr/bin/login
termux-tools: /data/data/com.termux/files/usr/bin/mount
termux-tools: /data/data/com.termux/files/usr/bin/ping
termux-tools: /data/data/com.termux/files/usr/bin/ping6
termux-tools: /data/data/com.termux/files/usr/bin/pkg
termux-tools: /data/data/com.termux/files/usr/bin/pm
termux-tools: /data/data/com.termux/files/usr/bin/settings
termux-tools: /data/data/com.termux/files/usr/bin/su
termux-tools: /data/data/com.termux/files/usr/bin/termux-change-repo
termux-tools: /data/data/com.termux/files/usr/bin/termux-fix-shebang
termux-tools: /data/data/com.termux/files/usr/bin/termux-info
termux-tools: /data/data/com.termux/files/usr/bin/termux-open
termux-tools: /data/data/com.termux/files/usr/bin/termux-open-url
termux-tools: /data/data/com.termux/files/usr/bin/termux-reload-settings
termux-tools: /data/data/com.termux/files/usr/bin/termux-reset
termux-tools: /data/data/com.termux/files/usr/bin/termux-setup-storage
termux-tools: /data/data/com.termux/files/usr/bin/termux-wake-lock
termux-tools: /data/data/com.termux/files/usr/bin/termux-wake-unlock
termux-tools: /data/data/com.termux/files/usr/bin/top
termux-tools: /data/data/com.termux/files/usr/bin/umount
termux-tools: /data/data/com.termux/files/usr/bin/xdg-open
termux-tools: /data/data/com.termux/files/usr/etc/motd
termux-tools: /data/data/com.termux/files/usr/etc/profile.d/init-termux-properties.sh
termux-tools: /data/data/com.termux/files/usr/share/doc/termux-tools/LICENSE
termux-tools: /data/data/com.termux/files/usr/share/examples/termux/termux.properties
termux-tools: /data/data/com.termux/files/usr/share/man/man1/termux.1.gz
```

***

# whatprovides
yum --whatprovides utility for termux.

* whatprovides can list files of any termux official packages, doesn't matter that package is installed or not, it uses own database to perform task.

* It can be used as reverse search, means provide full path of any file it will give you output of that pkg.


### Installation:

```
pkg install whatprovides
```

### Manual Installation:

```
pkg install git gawk gzip make sqlite
git clone https://github.com/termux/whatprovides
cd whatprovides
make install
```

### Usage:

* List files of any package. For eg. aapt

```sh
$ whatprovides -p aapt
aapt: /data/data/com.termux/files/usr/bin/aapt
aapt: /data/data/com.termux/files/usr/bin/zipalign
aapt: /data/data/com.termux/files/usr/lib/libandroid-base.so
aapt: /data/data/com.termux/files/usr/lib/libandroid-cutils.so
aapt: /data/data/com.termux/files/usr/lib/libandroid-fw.so
aapt: /data/data/com.termux/files/usr/lib/libandroid-utils.so
aapt: /data/data/com.termux/files/usr/lib/libandroid-ziparchive.so
aapt: /data/data/com.termux/files/usr/share/aapt/android.jar
aapt: /data/data/com.termux/files/usr/share/doc/aapt/LICENSE
```

* search for files. Have you ever used `dpkg -S filepath`. 
Here you need to use like `whatprovides filepath`. 
You can search for any files which even not exist in your termux.
it will show you which package provide that file.
```sh
$ whatprovides $PREFIX/share/aapt
aapt: /data/data/com.termux/files/usr/share/aapt
```
