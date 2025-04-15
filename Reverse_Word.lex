%{
#include <stdio.h>
#include <string.h>

// Function to reverse and print a word
void reverse_and_print(char *str) {
    int len = strlen(str);
    for (int i = len - 1; i >= 0; i--) {
        putchar(str[i]);
    }
}
%}

%%
[a-zA-Z]+    { reverse_and_print(yytext); putchar(' '); }  
[ \t\n]+     { printf("%s", yytext); }                     
.            { printf("%s", yytext); }                     
%%

int main() {
    yylex();
    return 0;
}
