%{ #include "y.tab.h" %}

%% [0-9]+ { yylval = atoi(yytext);
return NUMBER; 
}
[\n] { return '\n';
} 
[+-*/()] { return yytext[0];
}
[ \t] ; // ignore spaces 
{ return yytext[0];
} %%

int yywrap() 
{ return 1; }

%{ 
#include <stdio.h> 
#include <stdlib.h>
%}

%token NUMBER %left '+' '-' %left '*' '/'

%% expr: expr '+' expr { = $1 + $3;
} | expr '-' expr { = $1 - $3;
} | expr '*' expr { = $1 * $3;
} | expr '/' expr { = $1 / $3;
} | '(' expr ')' { = $2;
} | NUMBER { = $1; 
} ;

input: expr '\n' { printf("Result: %d\n", $1); 
return 0; } ;
%%


int main() 
{ printf("Enter arithmetic expression:\n"); 
yyparse(); 
return 0;
}

int yyerror(char* s) { printf("Error: %s\n", s); 
return 0;
}
