PREFIX := /data/data/com.termux/files/usr
BIN = whatprovides

.PHONY: install
install:
	install -Dm700 -t $(PREFIX)/bin $(BIN)
