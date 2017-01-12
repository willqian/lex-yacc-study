%{
int num_lines;
int num_chars;
%}
%%
\n      ++num_lines; ++num_chars;
.       ++num_chars;
%%
main() {
    yylex();
    printf("# of lines = %d, # of chars = %d\n", num_lines, num_chars);
}

int yywrap() {
    return 1;
}
