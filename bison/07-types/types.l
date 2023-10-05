
%{
#include <stdbool.h>
#include <stdlib.h>
#include "types.tab.h"

#include "types.h"

extern int yyerror (char const *msg, ...);

static char *ptr;
%}
T_CHARACTER ['][a-zA-Z][']
T_UINT      [+]?[0-9]+
T_INT       [+-]?[0-9]+
T_REAL      [0-9]+\.?|[0-9]*\.[0-9]+ 
T_ID        [a-zA-Z][a-zA-Z0-9_]*
T_SPACE     [ \t\n]
%option noyywrap nodefault yylineno
%%
["']                            { return yytext[0]; }
[,:=;]                          { return yytext[0]; }
[-+*/]                          { return yytext[0]; }
"var"                           { return T_VAR; }
"f64"                           { return T_F64; }
"f32"                           { return T_F32; }
"i64"                           { return T_I64; }
"i32"                           { return T_I32; }
"i16"                           { return T_I16; }
"i8"                            { return T_I8; }
"u64"                           { return T_U64; }
"u32"                           { return T_U32; }
"u16"                           { return T_U16; }
"u8"                            { return T_U8; }
"bool"                          { return T_BOOL; }
"char"                          return T_CHAR;
"str"                           { return T_STR; }
"false"                         { yylval.val.b = false; return T_FALSE; }
"true"                          { yylval.val.b = true; return T_FALSE; }
{T_UINT}                        { yylval.val.u64 = strtoul(yytext, &ptr, 10); return T_UINT; }
{T_INT}                         { yylval.val.i64 = atol(yytext); return T_INT; }
{T_REAL}                        { yylval.val.f64 = atof(yytext); return T_REAL; }
{T_CHARACTER}                   { yylval.val.ch = yytext[0]; return T_CHARACTER; }
{T_ID}                          { yylval.s = strdup(yytext); return T_ID; }
{T_SPACE}                       { ; }
\"([^\\\"]|\\.)*\"              { yylval.val.str = strdup(yytext); return T_STRING; }
.                               { yyerror("unknown token %s\n", yytext); }
%%