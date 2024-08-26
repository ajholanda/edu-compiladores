/* Example 2-1. Word count, reading one file. Source: "flex & bison"
   book.
   Exercício 3d
*/

%option noyywrap
%{
int chars = 0; // bytes
int words = 0; // palavras
int lines = 0; // linhas
%}

%%
// selecionar somente palavras
[a-zA-Z]+    { words++; chars += strlen(yytext); }
\n           { chars++; lines++; }
.            { chars++; }

%%
int main(int argc, char **argv) {
    if (argc > 1) {
	if (!(yyin = fopen(argv[1], "r"))) {
	    perror(argv[1]);
	    return 1;
	}
    }

    yylex();
    printf(" %d %d %d %s\n", lines, words, chars, argv[1]);

    return 0;
}
