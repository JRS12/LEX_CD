%{
#include "y.tab.h"
%}

%%
[01]+     { yylval.str = strdup(yytext); return BINARY; }
[ \t\n]+  ;  // Ignore whitespace
.         { return yytext[0]; }
%%
