
CFLAGS_DBUS = $(shell pkg-config --cflags --libs dbus-1)
CFLAGS_DBUS_GLIB = $(shell pkg-config --cflags --libs dbus-glib-1)
CFLAGS_GIO  = $(shell pkg-config --cflags --libs gio-2.0)

CFLAGS = -g -Wall -Werror


all: dbus-plserver dbus-plclient

dbus-plserver: src/dbus-plserver.c
	${CC} $< -o $@ $(CFLAGS) $(CFLAGS_DBUS) $(CFLAGS_DBUS_GLIB)

dbus-plclient: src/dbus-plclient.c
	${CC} $< -o $@ $(CFLAGS) $(CFLAGS_GIO)

clean:
	rm -f dbus-plserver
	rm -f dbus-plclient


.PHONY: all clean
