# Checagem de tipos

O analisador deste diretório faz a checagem do tipos de 
uma linguagem hipotética onde:

------------------------
tipo    | descrição
--------|-----------------
i64     | inteiro de 64 bits
i32     | inteiro de 32 bits
i16     | inteiro de 16 bits
i8      | inteiro de 8 bits
u64     | inteiro de 64 bits sem sinal
u32     | inteiro de 32 bits sem sinal
u16     | inteiro de 16 bits sem sinal
u8      | inteiro de 8 bits sem sinal
f64     | ponto flutuante de 64 bits
f32     | ponto flutuante de 32 bits
char    | caracter (conjunto reduzido a [a-zA-Z0-9])
str     | _string_
bool    | Booleano `true` ou `false`

A palavra reservada `var` marca o início da declaração 
das variáveis, sendo que todas as variáveis devem ser 
inicializadas. Cada variável ou variáveis do mesmo tipo 
devem ser declaradas uma por linha.

A linguagem permite atribuição dupla na declaração, por exemplo:

```
var
    p, q : i64 = 1000, 20000;
    r    : i32 = 800;
```

declara as variáveis `p` que é inicializada com o valor 1000
e `q` com o valor 20000, ambas do tipo `i64`. A variável `r` 
é declarado como sendo do tipo `i32` é possui valor 800 
durante a inicialização. O ponto e vírgula ";" encerra as 
declaração de variaveis de um tipo de dados.

Para testar o compilador, execute:

```
> lex -o types.yy.c types.l
> yacc -d --debug --verbose -o types.tab.c types.y
> cc -o types types.tab.c
> ./types arg1.txt 2> types.log
```

A saída consistirá no percurso realizado pelo analisador 
sintático no arquivo [`arg1.txt`](arg1.txt) verificando cada _token_ e 
reduzindo a pilha se uma regra é satisfeita. Se o compilador
parar a execução no primeiro não-terminal `block` que é reduzido a 
`program` (início do programa) e retorna `0` é sinal de qua a sintaxe 
está correta. **Não há nenhuma ação semântica associada à regras**. 
A saída será escrita em um arquivo chamado `types.log`.

---

