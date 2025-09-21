CC = gcc
TARGET = bin/client
SOURCES = src/main.c src/mystrfunctions.c src/myfilefunctions.c

$(TARGET): $(SOURCES)
	$(CC) -Iinclude $(SOURCES) -o $(TARGET)

clean:
	rm -f $(TARGET)

