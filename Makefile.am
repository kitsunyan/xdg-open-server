CLEANFILES =

desktop = xdg-open-server.desktop

applicationdir = $(prefix)/share/applications
autostartdir = $(sysconfdir)/xdg/autostart

dist_application_DATA = $(desktop)
dist_autostart_DATA = $(desktop)
dist_pkgdata_DATA = $(shell find scripts/ -name "*.sh")

bin_PROGRAMS = xdg-open-server

xdg_open_server_SOURCES = \
	main.c

xdg_open_server_LDFLAGS = \
	-L/usr/X11/lib \
	-lX11 \
	-lpthread

CLEANFILES += $(bin_PROGRAMS)

install-data-hook:
	chmod +x $(DESTDIR)$(pkgdatadir)/*.sh
