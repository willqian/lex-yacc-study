%{
int lengs[1000];
char *p;
%}
a       [aA]
b       [bB]
c       [cC]
d       [dD]
e       [eE]
f       [fF]
g       [gG]
h       [hH]
i       [iI]
j       [jJ]
k       [kK]
l       [lL]
m       [mM]
n       [nN]
o       [oO]
p       [pP]
q       [qQ]
r       [rR]
s       [sS]
t       [tT]
u       [uU]
v       [vV]
w       [wW]
x       [xX]
y       [yY]
z       [zZ]
W       [ \t]*
%%
{d}{o}{u}{b}{l}{e}{W}{p}{r}{e}{c}{i}{s}{i}{o}{n} {
    printf(yytext[0] == 'd' ? "real" : "REAL");
}
^"     "[^ 0]   ECHO;

[0-9]+{W}{d}{W}[+-]?{W}[0-9]+           |
[0-9]+{W}"."{W}{d}{W}[+-]?{W}[0-9]+     |
"."{W}[0-9]+{W}{d}{W}[+-]?{W}[0-9]+     {
    /* convert constants */
    for (p = yytext; *p != 0; p++) {
        if (*p == 'd' || *p == 'D') {
            *p += 'e'- 'd';
        }
    }
    ECHO;    
}

{d}{s}{i}{n}        |
{d}{c}{o}{s}        |
{d}{s}{q}{r}{t}     |
{d}{a}{t}{a}{n}     |
{d}{f}{l}{o}{a}{t}  printf("%s", yytext + 1);

{d}{l}{o}{g}    |
{d}{l}{o}{g}10  |
{d}{m}{i}{n}1   |
{d}{m}{a}{x}1   {
                yytext[0] += 'a' - 'd';
                ECHO;
                }

{d}1{m}{a}{c}{h}    {
                    yytext[0] += 'r'  - 'd';
                    ECHO;
                    }
[A-Za-z][A-Za-z0-9]*    |
[0-9]+                  |
\n                      |
.                       ECHO;
%%

main(int argc, char *argv[]) {
    return yylex();
}

int yywrap() {
    return 1;
}

