# Simple Makefile for Both Libraries
CC = gcc
CFLAGS = -Wall

all: bin/client_static bin/client_dynamic

# Static library
lib/libmyutils.a: src/mystrfunctions.c src/myfilefunctions.c
	mkdir -p lib
	$(CC) $(CFLAGS) -Iinclude -c src/mystrfunctions.c -o mystrfunctions.o
	$(CC) $(CFLAGS) -Iinclude -c src/myfilefunctions.c -o myfilefunctions.o
	ar rcs lib/libmyutils.a mystrfunctions.o myfilefunctions.o
	rm mystrfunctions.o myfilefunctions.o

# Static executable
bin/client_static: src/main.c lib/libmyutils.a
	mkdir -p bin
	$(CC) $(CFLAGS) -Iinclude -Llib -o $@ src/main.c -lmyutils

# Dynamic library
lib/libmyutils.so: src/mystrfunctions.c src/myfilefunctions.c
	mkdir -p lib
	$(CC) $(CFLAGS) -fPIC -shared -Iinclude -o $@ src/mystrfunctions.c src/myfilefunctions.c

# Dynamic executable
bin/client_dynamic: src/main.c lib/libmyutils.so
	mkdir -p bin
	$(CC) $(CFLAGS) -Iinclude -Llib -o $@ src/main.c -lmyutils

clean:
	rm -rf bin lib

test:
	@echo "=== Testing Static ==="
	./bin/client_static
	@echo ""
	@echo "=== Testing Dynamic ==="
	export LD_LIBRARY_PATH=lib:$$LD_LIBRARY_PATH && ./bin/client_dynamic

.PHONY: all clean test
install:
	sudo cp bin/client_dynamic /usr/local/bin/client
	sudo mkdir -p /usr/local/share/man/man1
	sudo cp man/man1/client.1 /usr/local/share/man/man1/
	echo "Installation complete!"
