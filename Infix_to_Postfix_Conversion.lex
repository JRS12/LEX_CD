%{ 
#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 
#define SIZE 100 char stack[SIZE]; 
int top = -1;

void push(char ch) { stack[++top] = ch;
} 
char pop() { return stack[top--];
} 
int precedence(char op) { if(op == '+' || op == '-') return 1; 
if(op == '*' || op == '/') return 2; return 0; 
} 
%}

%% [0-9]+ { printf("%s ", yytext);
}
"(" { push('('); } ")" { while(stack[top] != '(') printf("%c ", pop());
pop();
// remove '(' } [+-*/] { while(top != -1 && precedence(stack[top]) >= precedence(yytext[0])) printf("%c ", pop()); 
push(yytext[0]); 
} \n { while(top != -1) printf("%c ", pop());
printf("\n"); 
} 
.|\t ; 
// ignore other characters %%

int main()
{ printf("Enter infix expression (end with ENTER):\n");
yylex(); 
return 0; 
}
