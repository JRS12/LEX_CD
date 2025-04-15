%{
#include <stdio.h>
%}

%%
[a-z]     { printf("%c", yytext[0] - 32); }  
[A-Z]     { printf("%c", yytext[0]); }       
[ \t\n]   { printf("%c", yytext[0]); }       
.         { printf("%c", yytext[0]); }       
%%

int main(void) {
    yylex();
    return 0;
}
