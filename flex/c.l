/*
    Exercicio 2c
*/

%option noyywrap
%{
int vowels = 0;
int cons = 0; // consoantes
%}

%%
[aeiouAEIOU]    { vowels++; }
[a-zA-Z]        { cons++; }
\n              {}
.               {}
%%
int main(int argc, char **argv) {
    if (argc > 1) {
	if (!(yyin = fopen(argv[1], "r"))) {
	    perror(argv[1]);
	    return 1;
	}
    }

    yylex();
    printf("%d vogais, %d consoantes", vowels, cons);

    return 0;
}
