CC=gcc
LDFLAGS=-L/usr/X11/lib -lX11 -lpthread

PREFIX=
PREFIX_USR=$(PREFIX)/usr/local
PREFIX_ETC=$(PREFIX)/etc

all:
	$(CC) $(CFLAGS) $(LDFLAGS) main.c -o xdg-open-server

clean:
	$(RM) xdg-open-server

install:
	[ -d $(PREFIX_USR)/bin ] || mkdir $(PREFIX_USR)/bin
	[ -d $(PREFIX_USR)/share/applications ] || mkdir -p $(PREFIX_USR)/share/applications
	[ -d $(PREFIX_ETC)/xdg/autostart ] || mkdir -p $(PREFIX_ETC)/xdg/autostart
	install -m 0755 xdg-open-server $(PREFIX_USR)/bin
	install -m 0644 xdg-open-server.desktop $(PREFIX_USR)/share/applications
	install -m 0644 xdg-open-server.desktop $(PREFIX_ETC)/xdg/autostart

uninstall:
	[ ! -f $(PREFIX_USR)/bin/xdg-open-server ] || $(RM) $(PREFIX_USR)/bin/xdg-open-server
	[ ! -f $(PREFIX_USR)/share/applications/xdg-open-server.desktop ] || $(RM) $(PREFIX_USR)/share/applications/xdg-open-server.desktop
	[ ! -f $(PREFIX_ETC)/xdg/autostart/xdg-open-server.desktop ] || $(RM) $(PREFIX_ETC)/xdg/autostart/xdg-open-server.desktop
	rmdir $(PREFIX_USR)/bin || true
	rmdir $(PREFIX_USR)/share/applications || true
	rmdir $(PREFIX_USR)/share || true
	rmdir $(PREFIX_ETC)/xdg/autostart || true
	rmdir $(PREFIX_ETC)/xdg || true
