
%{
#include <stdlib.h>
#include "calc.tab.h"

extern int yyerror (char const *msg, ...);
%}

%option noyywrap nodefault yylineno
%%
[0-9]+\.?|[0-9]*\.[0-9]+        { yylval.d = atof(yytext); return NUMBER; }
[-+*/\n]                        { return yytext[0]; }
[ \t]                           { ; }
.                               { yyerror("unknown token %s\n", yytext); }
%%

