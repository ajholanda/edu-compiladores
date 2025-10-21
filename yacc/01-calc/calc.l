%{
#include <stdlib.h>
#include "calc.tab.h" 

extern int yyerror (char const *msg, ...);
%}

%option noyywrap nodefault yylineno
%%
[0-9]                       { yylval.d = atoi(yytext); return DIGIT; }
[*+()\n]                    { return yytext[0]; }
[ \t]                       { ; /* ignore */ }
.                           { yyerror("unknown token %s\n", yytext); }
%%
