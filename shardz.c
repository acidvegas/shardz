// SHARDZ - Shard the output of any process for distributed processin - Developed by acidvegas in C (https://github.com/acidvegas/shardz)
// shardz.c

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_usage(const char* program_name) {
    fprintf(stderr, "Usage: %s INDEX/TOTAL\n", program_name);
    exit(1);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        print_usage(argv[0]);
    }

    char *slash = strchr(argv[1], '/');
    if (!slash) {
        print_usage(argv[0]);
    }

    *slash = '\0';
    char *index_str = argv[1];
    char *total_str = slash + 1;

    char *endptr;
    long index = strtol(index_str, &endptr, 10);
    if (*endptr != '\0' || index < 1) {
        print_usage(argv[0]);
    }

    long total = strtol(total_str, &endptr, 10);
    if (*endptr != '\0' || total < 1) {
        print_usage(argv[0]);
    }

    if (index > total) {
        fprintf(stderr, "Error: INDEX cannot be greater than TOTAL\n");
        exit(1);
    }

    char *line = NULL;
    size_t len = 0;
    ssize_t read;
    long current_line = 1;

    while ((read = getline(&line, &len, stdin)) != -1) {
        if (((current_line - index) % total) == 0) {
            printf("%s", line);
        }
        current_line++;
    }

    free(line);
    return 0;
} 