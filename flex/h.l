/*
    Exercicio 2f
*/

%option noyywrap
%{
int keywords = 0;
int funcs = 0;
int numbers = 0;
int spchars = 0;
%}

%%
char|int|float|long|double                  { /* do nothing */}
if|else|while|do|switch|case|return         { keywords++; }
"!"|"@"|"*"|"&"|"|"|"%"|"$"|"#"             { spchars++; }
[a-zA-Z][a-zA-Z0-9_][ \t]*\(.*\)[ \t\n]*\{  { funcs++; }
[0-9]+                                      { numbers++; }
\n                                          {}
.                                           {}
%%
int main(int argc, char **argv) {
    if (argc > 1) {
	if (!(yyin = fopen(argv[1], "r"))) {
	    perror(argv[1]);
	    return 1;
	}
    } else {
	fprintf(stderr, "usage: %s file.c\n", argv[0]);
	exit(1);
    }

    yylex();
    printf("%d palavra(s) reservada(s), \n%d caracteres especiais, \
    \n%d funcoes, \n%d numero(s).\n",
	    keywords, spchars, funcs, numbers);

    return 0;
}
