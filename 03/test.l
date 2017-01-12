%{
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
int num_lines;
int num_chars;
%}
%%
\n      ++num_lines; ++num_chars;
.       ++num_chars;
%%
main(int argc, char *argv[]) {
    int fd;
    if (argc != 2) {
        printf("usage: ./test input_file");
        return 0;
    }
    fd = open(argv[1], O_RDONLY);
    if (fd < 0) {
        printf("file open failed");
        return 0;
    }
    yyin = fdopen(fd, "r");
    yylex();
    fclose(yyin);
    printf("# of lines = %d, # of chars = %d\n", num_lines, num_chars);
}

int yywrap() {
    return 1;
}
