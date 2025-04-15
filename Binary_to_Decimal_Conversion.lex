%{ #include <stdio.h> 
#include <math.h> %}

%% [01]+ { int i, len = yyleng, dec = 0; 
for(i = 0;i < len; i++) 
{ if(yytext[i] == '1') dec += pow(2, len - i - 1);
} 
printf("Binary: %s => Decimal: %d\n", yytext, dec); 
} 
.|\n ;
%%

int main() 
{ printf("Enter a binary number: "); 
yylex(); 
return 0; 
}
