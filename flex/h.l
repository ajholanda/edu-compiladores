/*
    Exercicio 2h
*/

%option noyywrap case-insensitive
%{
    enum tokentype {
        SELECT = 258,
        FROM = 259,
        WHERE = 260,
        ID = 261,
        EOL = 262
    };
void install_id(char *id);

%}

id                  [A-Za-z][A-Za-z0-9_]+

%%
"select"                    { return SELECT; }
"from"                      { return FROM; }
"where"                     { return WHERE; }
{id}                        { return ID; } 
\n                          { return EOL; }
[ \t\n]                     {}
.                           {}

%%

void install_id(char *id) {
    char lower_id[256];
    
    strncpy(lower_id, id, 256);
    printf(" -> add \"%s\" to symbol table\n", lower_id);
}

int main(int argc, char **argv) {
    int tok;

    while ((tok = yylex())) {
        printf("%d", tok);

        if (tok == ID) {
            install_id(yytext);
        } else {
            printf("\n");
        }
    }

    return 0;
}
