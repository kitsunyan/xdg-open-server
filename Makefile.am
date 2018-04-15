mypkglibdir = $(pkglibdir)
applicationdir = $(prefix)/share/applications
autostartdir = $(sysconfdir)/xdg/autostart

dist_mypkglib_SCRIPTS = \
	xdg-open

dist_application_DATA = \
	xdg-open-server.desktop

dist_autostart_DATA = \
	xdg-open-server.desktop

bin_PROGRAMS = \
	xdg-open-server

xdg_open_server_SOURCES = \
	main.c

xdg_open_server_LDFLAGS = \
	-L/usr/X11/lib \
	-lX11 \
	-lpthread
