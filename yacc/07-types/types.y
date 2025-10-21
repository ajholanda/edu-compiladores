/* 
   Avaliacao simbolica de expressoes aritmeticas
*/

%{
#include <stdarg.h>
#include <stdbool.h> // not good idea for old compilers
#include <stdio.h>
#include <stdint.h>  // not good idea for old compilers
#include <stdlib.h>

/* tabela de simbolos */
#include "types.h"

/* 
  To debug, uncomment and run 
  bison --verbose --debug -d file.y 
*/
int yydebug = 1;

%}
%union {
        union value_union val;      
        char            c;
        char            *s;
}

%token T_F64 T_F32
%token T_I64 T_I32 T_I16 T_I8
%token T_U64 T_U32 T_U16 T_U8
%token T_BOOL T_CHAR T_STR
%token T_VAR
%token <str> T_ID
%token <val.i64> T_INT 
%token <val.u64> T_UINT
%token <val.f64> T_REAL
%token <val.b> T_TRUE T_FALSE
%token <val.str> T_STRING 
%token <val.ch> T_CHARACTER
%type <val> value

%start program

/* 
   Gramatica 
*/

%%
program         : block { return 0; }                  
                ;

block           : T_VAR decl_list
                |
                ;

decl_list       : decl
                | decl_list decl
                ;

decl            : id_list ':' type '=' val_list ';'
                ;

val_list        : value
                | val_list ',' value

id_list         : T_ID 
                | id_list ',' T_ID
                ;

type            : T_F64  | T_F32
                | T_I64  | T_I32 | T_I16 | T_I8
                | T_U64  | T_U32 | T_U16 | T_U8
                | T_CHAR | T_STR
                | T_BOOL
                ;

value           : T_FALSE               { $$.b   = $1; }
                | T_TRUE                { $$.b   = $1; }
                | T_UINT                { $$.u64 = $1; }
                | T_INT                 { $$.i64 = $1; }
                | T_REAL                { $$.f64 = $1; }
                | T_STRING              { $$.str = $1; }
                | T_CHARACTER           { $$.ch  = $1; }
                ;
%%
#include "types.yy.c"

int yyerror(const char *msg, ...) {
	va_list args;

	va_start(args, msg);
	vfprintf(stderr, msg, args);
	va_end(args);

	return 0;
}

int main (int argc, char **argv) {
        FILE *fp;
        
        if (argc <= 0) {
                fprintf(stderr, "usage: %s file\n", argv[0]);
		return 1;
	}

        fp = fopen(argv[1], "r");
        if (!fp) {
                perror(argv[1]);
		return 1;
	}

        yyin = fp;
        do {
                yyparse();
        } while(!feof(yyin));

        return EXIT_SUCCESS;
}
