/*
    Exercicio 3i
*/

%option noyywrap
%{
    enum tokentype {
        INTEGER = 258,
        FLOAT = 259,
        ADD = 260,
        SUB = 261,
        MUL = 262,
        DIV = 263,
        EOL = 264
    };
    int ival;
    float fval;
%}

digit                  [0-9]

%%
"+"                     { return ADD; }
"-"                     { return SUB; }
"*"                     { return MUL; }
"/"                     { return DIV; }
{digit}+                { ival = atoi(yytext); return INTEGER; }
{digit}+(\.{digit}+)?   { fval = atof(yytext); return FLOAT; }
\n                      { return EOL; }
[ \t]                   {}
.                       { printf("lexema desconhecido: %s\n", *yytext); }

%%
int main(int argc, char **argv) {
    int tok;

    while ((tok = yylex())) {
        printf("%d", tok);

        if (tok == INTEGER)
            printf(" = %d\n", ival);
        else if (tok == FLOAT)
            printf(" = %f\n", fval);
        else
            printf("\n");
    }

    return 0;
}
