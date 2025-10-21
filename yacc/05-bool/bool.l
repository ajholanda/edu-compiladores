
%{
#include <stdlib.h>
#include "bool.tab.h"

extern int yyerror (char const *msg, ...);
%}

%option noyywrap nodefault yylineno
%%
[01]        { yylval.b = atof(yytext); return BOOL; }
[|&^~()\n]    { return yytext[0]; }
[ \t]       { ; }
.           { yyerror("unknown token %s\n", yytext); }
%%

