#include <stdio.h>
#include <stdlib.h>              // <-- Add this for malloc/free
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");
    char s1[100] = "Hello", s2[100] = "World";

    printf("mystrlen(\"Hello\"): %d\n", mystrlen("Hello"));

    mystrcpy(s2, s1);
    printf("mystrcpy: %s\n", s2);

    mystrncpy(s2, "Goodbye", 4);
    s2[4] = '\0';
    printf("mystrncpy: %s\n", s2);

    mystrcat(s1, " World");
    printf("mystrcat: %s\n", s1);

    // --- Testing File Functions ---
    printf("\n--- Testing File Functions ---\n");
    FILE* fp = fopen("test.txt", "r");
    if (!fp) {
        perror("test.txt not found");
        return 1;
    }

    int lines, words, chars;
    if (wordCount(fp, &lines, &words, &chars) == 0)
        printf("Lines: %d, Words: %d, Chars: %d\n", lines, words, chars);

    char** matches = NULL;
    int count = mygrep(fp, "test", &matches);
    if (count > 0) {
        printf("Matching lines:\n");
        for (int i = 0; i < count; i++) {
            printf("%s", matches[i]);
            free(matches[i]);   // <-- now compiler knows free()
        }
        free(matches);
    }

    fclose(fp);
    return 0;
}

