CC = gcc
CFLAGS = -Wall -Iinclude

LIB = lib/libmyutils.a
OBJS = obj/mystrfunctions.o obj/myfilefunctions.o
MAIN = obj/main.o
TARGET = bin/client_static

all: $(TARGET)

# Rule for final program
$(TARGET): $(MAIN) $(LIB)
	$(CC) $(CFLAGS) -o $@ $(MAIN) -Llib -lmyutils

# Rule for static library
$(LIB): $(OBJS)
	ar rcs $@ $^

# Compile source files into object files
obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f obj/*.o $(TARGET) $(LIB)

