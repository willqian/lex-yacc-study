%%
[ \t]+$ ;
[ \t]+  printf(" ");
%%
main() {
    return yylex();
}

int yywrap() {
    return 1;
}
