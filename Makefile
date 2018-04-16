DESTDIR =
PREFIX = /usr/local
SYSCONFDIR = ${PREFIX}/etc

BINDIR = ${PREFIX}/bin
PKGLIBDIR = ${PREFIX}/lib/xdg-open-server
APPLICATIONSDIR = ${PREFIX}/share/applications
AUTOSTARTDIR = ${SYSCONFDIR}/xdg/autostart

CC = gcc

.PHONY: all clean install uninstall

all: \
	xdg-open-server

xdg-open-server: main.c
	$(CC) $(CFLAGS) -lX11 -lpthread $(LDFLAGS) $< -o $@

clean:
	@rm -rfv xdg-open-server

install:
	install -Dm755 'xdg-open-server' '${DESTDIR}${BINDIR}/xdg-open-server'
	install -Dm644 'xdg-open-server.desktop' '${DESTDIR}${APPLICATIONSDIR}/xdg-open-server.desktop'
	install -Dm644 'xdg-open-server.desktop' '${DESTDIR}${AUTOSTARTDIR}/xdg-open-server.desktop'
	install -Dm755 'xdg-open' '${DESTDIR}${PKGLIBDIR}/xdg-open'

uninstall:
	rm '${DESTDIR}${BINDIR}/xdg-open-server'
	@rmdir -p '${DESTDIR}${BINDIR}' 2> /dev/null || true
	rm '${DESTDIR}${APPLICATIONSDIR}/xdg-open-server.desktop'
	@rmdir -p '${DESTDIR}${APPLICATIONSDIR}' 2> /dev/null || true
	rm '${DESTDIR}${AUTOSTARTDIR}/xdg-open-server.desktop'
	@rmdir -p '${DESTDIR}${AUTOSTARTDIR}' 2> /dev/null || true
	rm '${DESTDIR}${PKGLIBDIR}/xdg-open'
	@rmdir -p '${DESTDIR}${PKGLIBDIR}' 2> /dev/null || true
