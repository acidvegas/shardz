# Compiler settings
CC      = gcc
CFLAGS  = -Wall -Wextra -O2
PREFIX  = /usr/local
VERSION = 1.0.1

# Files
PROG    = shardz
SOURCES = shardz.c
OBJECTS = $(SOURCES:.c=.o)

# Targets
all: $(PROG)

$(PROG): $(OBJECTS)
	$(CC) $(OBJECTS) $(CFLAGS) -o $(PROG)

install: $(PROG)
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 755 $(PROG) $(DESTDIR)$(PREFIX)/bin/$(PROG)
	install -d $(DESTDIR)$(PREFIX)/lib/pkgconfig
	install -m 644 shardz.pc $(DESTDIR)$(PREFIX)/lib/pkgconfig/
	install -d $(DESTDIR)$(PREFIX)/share/man/man1
	install -m 644 man/shardz.1 $(DESTDIR)$(PREFIX)/share/man/man1/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(PROG)
	rm -f $(DESTDIR)$(PREFIX)/lib/pkgconfig/shardz.pc
	rm -f $(DESTDIR)$(PREFIX)/share/man/man1/shardz.1

clean:
	rm -f $(PROG) $(OBJECTS)

.PHONY: all install uninstall clean 