/*
    Exercicio 3b
*/

%option noyywrap
%{
int uppers = 0;
int lowers = 0;
int numbers = 0;
%}

%%
[A-Z]   { uppers++; }
[a-z]   { lowers++; }
[0-9]   { numbers++; }

%%
int main(int argc, char **argv) {
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return 1;
        }
    }

    yylex();
    printf("%d maiusculas, %d minusculas, %d numeros\n", 
            uppers, lowers, numbers);

    return 0;
}