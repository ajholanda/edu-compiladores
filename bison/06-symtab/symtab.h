#ifndef __SYMTAB_H__
#define __SYMTAB_H__

#define MAXTOKEN 32
#define MAXSYMS 256

struct symtab {
        char id[MAXTOKEN];
        int val;
};

extern void assign(char *id, int val);

/* flex */
extern int yylineno;

extern int yyerror (char const *msg, ...);
extern int yylex();

#endif