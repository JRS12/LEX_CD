%{ 
#include <stdio.h> 
#include <string.h>
%}

%% [a-zA-Z]+ { int len = strlen(yytext), i, flag = 1;
for(i = 0; i < len / 2; i++) 
{ if(yytext[i] != yytext[len - i - 1]) 
{ flag = 0; break; } } 
if(flag) 
printf("%s is a palindrome.\n", yytext);
else printf("%s is not a palindrome.\n", yytext);
}
\n|. ; 
%%

int main()
{ printf("Enter a word to check palindrome:\n");
yylex(); 
return 0;
}
