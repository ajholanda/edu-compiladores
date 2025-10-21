/*
    Exercicio 3h
*/
%option noyywrap
%{
int keywords = 0;
int ntypes = 0;
int numbers = 0;
int spchars = 0;
%}

%%
(char|double|int|float|long|void)[ \t*]+        { ntypes++; }
(if|while|switch)[ \t]\(                        { keywords++; }
"!"|"@"|"&"|"|"|"%"|"$"|"#"                 { printf("%s\n", yytext);spchars++; }
[0-9]+                                          { numbers++; }
[ \t\r\n]                                       {}
.                                               {}
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
    \n%d tipos, \n%d numero(s).\n",
	    keywords, spchars, ntypes, numbers);

    return 0;
}
