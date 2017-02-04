CLEANFILES =

desktop = xdg-open-server.desktop

applicationdir = $(prefix)/share/applications
autostartdir = $(sysconfdir)/xdg/autostart

application_DATA = $(desktop)
autostart_DATA = $(desktop)

bin_PROGRAMS = xdg-open-server

xdg_open_server_SOURCES = \
	main.c

xdg_open_server_LDFLAGS = \
	-L/usr/X11/lib \
	-lX11 \
	-lpthread

CLEANFILES += $(bin_PROGRAMS)
