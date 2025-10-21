/*
    Exercicio 3e
*/

%option noyywrap
%{
    enum type_enum {INTEGER, FLOAT};
    int install_num(char *text, enum type_enum type);
%}

digit       [0-9]

%%

{digit}+                    { install_num(yytext, INTEGER); }
{digit}+"."{digit}+         { install_num(yytext, FLOAT); }
\n                          {}
.                           {}
%%

int install_num(char *text, enum type_enum type) {
    int i;
    float f;

    switch(type) {
        case INTEGER:
            i = atoi(text);
            printf("inteiro: %d\n", i);
            break;
        case FLOAT:
            f = atof(text);
            printf("ponto flutuante: %f", f);
            break;
        default:
        return 1;
        break;
    }
    return 0;
}

int main(int argc, char **argv) {
    if (argc > 1) {
	    if (!(yyin = fopen(argv[1], "r"))) {
	        perror(argv[1]);
	        return 1;
	    }
    }

    yylex();

    return 0;
}
