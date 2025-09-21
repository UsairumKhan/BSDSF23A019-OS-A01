#include "../include/myfilefunctions.h"
#include <stdlib.h>
#include <string.h>

int wordCount(FILE* file, int* lines, int* words, int* chars) {
    if (!file || !lines || !words || !chars) return -1;

    *lines = *words = *chars = 0;
    int ch, in_word = 0;
    while ((ch = fgetc(file)) != EOF) {
        (*chars)++;
        if (ch == '\n') (*lines)++;
        if (ch == ' ' || ch == '\n' || ch == '\t') {
            in_word = 0;
        } else if (!in_word) {
            in_word = 1;
            (*words)++;
        }
    }
    rewind(file);
    return 0;
}

int mygrep(FILE* fp, const char* search_str, char*** matches) {
    if (!fp || !search_str || !matches) return -1;

    size_t size = 0, capacity = 10;
    *matches = malloc(capacity * sizeof(char*));
    if (!*matches) return -1;

    char* line = NULL;
    size_t len = 0;
    ssize_t read;

    while ((read = getline(&line, &len, fp)) != -1) {
        if (strstr(line, search_str)) {
            if (size >= capacity) {
                capacity *= 2;
                *matches = realloc(*matches, capacity * sizeof(char*));
            }
            (*matches)[size++] = strdup(line);
        }
    }

    free(line);
    rewind(fp);
    return size;
}
