/* 
   Avaliacao simbolica de expressoes aritmeticas
*/

%{
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

/* tabela de simbolos */
#include "symtab.h"

static struct symtab symbols[MAXSYMS];
static int nsyms = 0; /* number of symbols */

/* 
  To debug, uncomment and run 
  bison --verbose --debug -d file.y 
*/
int yydebug = 1;

%}
%union {
        int i;
        char *s; /* string */
}

%token  <i> T_INT
%token  <s> T_ID
%type   <i> expr

%left '+' '-'
%left '*' '/'
%right '='

%start program

/* 
   Gramatica 
   decl - declaration (declaração) 
*/

%%
program         : assign_list { return 0; }                  
                ;

assign_list     : assignment
                | assignment  assign_list
                ;

assignment      : T_ID '=' expr ';'             { assign($1, $3); }
                ;

expr            : expr '+' expr                 { $$ = $1 + $3; }
                | expr '-' expr                 { $$ = $1 - $3; }
                | expr '*' expr                 { $$ = $1 * $3; }
                | expr '/' expr                 { $$ = $1 / $3; }
                | T_INT                         { $$ = $1; }
                ;
%%
#include "symtab.yy.c"

int yyerror(const char *msg, ...) {
	va_list args;

	va_start(args, msg);
	vfprintf(stderr, msg, args);
	va_end(args);

        return 0;
}

static struct symtab *lookup(char *id) {
        int i;
        struct symtab *p;

        for (i = 0; i < nsyms; i++) {
                p = &symbols[i];
                if (strncmp(p->id, id, MAXTOKEN) == 0)
                        return p;
        }

        return NULL;
}

static void install(char *id, int val) {
        struct symtab *p;

        p = &symbols[nsyms++];
        strncpy(p->id, id, MAXTOKEN);
        p->val = val;
}

void assign(char *id, int val) {
        struct symtab *p;

        p = lookup(id);
        if(p == NULL)
                install(id, val);
        else
                p->val = val;
}


int main (int argc, char **argv) {
        FILE *fp;
        int i;
        struct symtab *p;

        if (argc <= 0)
                yyerror("usage: %s file\n", argv[0]);

        fp = fopen(argv[1], "r");
        if (!fp)
                yyerror("error: could not open %s.\n", argv[1]);

        yyin = fp;
        do {
                yyparse();
        } while(!feof(yyin));


        for (i = 0; i < nsyms; i++) {
                p = &symbols[i];
                printf("%s=%d\n", p->id, p->val);
        }

        return EXIT_SUCCESS;
}
