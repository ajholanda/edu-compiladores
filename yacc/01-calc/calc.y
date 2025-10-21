/* 
   Calculadora de mesa simples (notação infixa)
*/

%{
/* Definicoes e declaracoes para analise lexica */
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

int yydebug = 1;

/* flex */
extern int yylineno;

extern int yyerror (char const *msg, ...);
extern int yylex();
%}

/* bison: declaracoes */
%union {
        int d;
}
%token <d> DIGIT
%type  <d> expr term factor

/* Gramatica */
%%
calc    :   expr '\n'           { printf("%d\n", $1); exit(0); }
        ;

expr    :   expr '+' term       { $$ = $1 + $3; }
        |   term                { $$ = $1; }
        ;

term    :   term '*' factor     { $$ = $1 * $3; }
        |   factor              { $$ = $1; }
        ;

factor  :   '(' expr ')'        { $$ = $2; }
        |   DIGIT               { $$ = $1; }
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
