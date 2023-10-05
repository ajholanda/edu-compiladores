/* 
   Calculadora de expressão aritmética em notação infixa
*/

%{
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

/* flex */
extern int yylineno;

extern int yyerror (char const *msg, ...);
extern int yylex();

%}

/* bison: declarações */
%union {
        double d;
}
%token  <d> NUMBER
%left   '+' '-'
%left   '*' '/'
%right  NEG
%type   <d> expr


/* Gramatica */
%%
lines   : lines expr  '\n'      { printf("%g\n", $2); exit(0); }
        | lines '\n'
        | /* vazio */
        | error'\n'             { yyerror("digite de novo: "); yyerrok; }
        ;

expr    : expr '+' expr         { $$ = $1 + $3; }
        | expr '-' expr         { $$ = $1 - $3; }
        | expr '*' expr         { $$ = $1 * $3; }
        | expr '/' expr         { $$ = $1 / $3; }
        | '(' expr ')'          { $$ = $2; }
        | '-' expr %prec NEG    { $$ = -$2; }
        | NUMBER
        ;

%%
#include "calc.yy.c"

int yyerror(const char *msg, ...) {
	va_list args;

	va_start(args, msg);
	vfprintf(stderr, msg, args);
	va_end(args);

	exit(EXIT_FAILURE);
}

int main (int argc, char **argv) {
        return  yyparse();
}
