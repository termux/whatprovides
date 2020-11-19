PREFIX := /data/data/com.termux/files/usr
BIN = whatprovides
DB_PATH = $(PREFIX)/share/whatprovides/db
DB_FILES = $(wildcard db/*)

.PHONY: install
install:
	install -Dm700 -t $(PREFIX)/bin $(BIN)
	for i in $(DB_FILES); do \
	  install -Dm600 $$i $(DB_PATH)/$$(basename $$i); \
	done
