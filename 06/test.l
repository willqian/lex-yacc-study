%{
int flag;
%}
%START DD EE FF
%%
^a  {flag = 'a'; ECHO;}
^b  {flag = 'b'; ECHO;}
^c  {flag = 'c'; ECHO;}
^d  {ECHO; BEGIN DD;}
^e  {ECHO; BEGIN EE;}
^f  {ECHO; BEGIN FF;}
\n  {ECHO; BEGIN 0;}
<DD>magic   printf("first");
<EE>magic   printf("second");
<FF>magic   printf("third");
magic   {
        switch (flag) {
        case 'a': printf("first"); break;        
        case 'b': printf("second"); break;        
        case 'c': printf("third"); break;        
        default: ECHO; break;        
        }
        }
%%

main(int argc, char *argv[]) {
    return yylex();
}

int yywrap() {
    return 1;
}

