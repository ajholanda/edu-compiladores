/* 
   Calculadora de expressão aritmética em notação polonesa reversa
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
%type   <d> rpn

/* Gramatica */
%%
lines   : lines rpn  '\n'      { printf("%g\n", $2); exit(0); }
        | lines '\n'
        | /* vazio */
        | error'\n'             { yyerror("digite de novo: "); yyerrok; }
        ;

rpn     : NUMBER
        | rpn rpn '+'         { $$ = $1 + $2; }
        | rpn rpn '-'         { $$ = $1 - $2; }
        | rpn rpn '*'         { $$ = $1 * $2; }
        | rpn rpn '/'         { $$ = $1 / $2; }
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
