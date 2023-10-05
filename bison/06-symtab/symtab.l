
%{
#include <stdlib.h>
#include "symtab.tab.h"

#include "symtab.h"

extern int yyerror (char const *msg, ...);
%}
T_ID        [a-zA-Z][a-zA-Z0-9_]*
T_INT       [0-9]+
T_SPACE     [ \t\n]
%option noyywrap nodefault yylineno
%%
[=;]                            { return yytext[0]; }
[-+*/]                          { return yytext[0]; }
{T_ID}                          { yylval.s = strdup(yytext); return T_ID; }
{T_INT}                         { yylval.i = atoi(yytext); return T_INT; }
{T_SPACE}                       { ; }
.                               { yyerror("unknown token %s\n", yytext); }
%%
