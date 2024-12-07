# Compiler settings
CC      = gcc
CFLAGS  = -Wall -Wextra -O2
PREFIX  = /usr/local

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

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(PROG)

clean:
	rm -f $(PROG) $(OBJECTS)

.PHONY: all install uninstall clean 