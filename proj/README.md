# Compiladores: Projeto

## A linguagem xyz

### Descrição

- Uma linguagem imperativa com a sintaxe parecida com a 
  linguagem C;
- Um programa `xyz` é uma sequência de definições de 
  funções sem recursividade e sem variáveis globais;
- A função principal, por onde é iniciada a execução 
  das instruções, chama-se `main`, retorna um valor e 
  não possui parâmetros;
- Só há dois tipos de dados na linguagem, o tipo **inteiro**
	de 64 bits (`i64`) e o tipo **ponto flutuante** de 
	64 bits (`f64`). Na avaliação booleana o `0` é falso 
	e qualquer número diferente de `0` corresponde ao booleano verdadeiro.
-  Espaço em branco, tabulação '\t', retorno de carro '\r' e nova linha
   '\n' devem ser ignorados.

**Restrições.** A linguagem é bem restrita, não havendo 
vetores, ponteiros e módulos. Todo o programa é definido em um 
único arquivo.

**Comentários.** Todos os comentários devem começar com "//".

### Funções

**Sintaxe**

- Uma definição de função começa com a palavra reservada 
  `fn` seguida pelo seu **nome**, uma lista de parâmetros 
    separados por vírgula entre parênteses e um corpo.
- Todas as funções devem retornar um valor mesmo que este 
    valor não seja usado diretamente. O retorno do valor é realizado 
    usando o comando `return`.
- Os parâmetros de uma função devem ser separados por vírgula.
   Exemplo: `fn foo(a i64, b f64) { ... }`.

### Proposição (*statement*)

Uma proposição na linguagem `xyz` pode ser:

- Proposição vazia;
- Declaração de variáveis (*declarations*);
- Atribuição (*assignment*);
- Incremento e decremento;
- Retorno de função;
- Chamada de função (*function call*);
- Desvio de fluxo, `if` com e sem `else`, 
	sem suporte a `else if`;
- Laço de repetição (*loop*), só há um, o `while`.

**Identificadores (*identifiers*).**

Um identificador (nome) é uma letra, opcionalmente seguida
por letras, números e sublinhado `'_'`.

**Declarações.**

Uma variável deve ser declarada antes de ser usada começando
pela palavra reservada **`var`** e uma lista de atribuições 
separada por vírgula `','`. Nenhuma variável pode ser 
declarada sem possuir um valor inicial.

**Expressões.**

As seguintes espressões exitem em `xyz`:

- Variáveis (`if a {...}`) e literais 
(`while 1 {...}`);
- Expressões binárias com os operadores: \\
` + - * / % > < >= <= == != && ||`;
- Expressões unárias com os operadores:
	`~` `!`;
- Chamadas de função.

A Listagem 1 mostra o código para o cálculo 
do fatorial como um exemplo de aplicação da linguagem 
`xyz`.

```
// fat.xyz
fn fatorial(n i64) {
        var
           i : i64 = 1,
           r : i64 = 1;
    
        if n < 0 {
            return -1;
        }

        while i < n + 1 {
            r = r * i;
            i++;
        }
        return r;
}
    
fn main() {
        var 
           i : i64 = 3,
           f : i64 = 0;
    
        f = fatorial(i);

        return 0;
}
```

Listagem 1. Exemplo de código usando a linguagem `xyz`.

## Descrição do projeto

A partir da definição da linguagem `xyz`:

1. Escreva uma analisador léxico usando o `lex`
para a linguagem;
2. Escreva um analisador sintático usando o `yacc`;
3. A partir do analisador sintático, imprima a tabela de 
símbolos para o código de entrada com os símbolos apresentados 
de acordo com o contexto. Por exemplo, para a Listagem 1
a saída da execução do compiladore seria parecida com:

```
fun fatorial
	var n: i64
	var i: i64 1
	var r: i64 1
fun main
	var i: i64 3
	var f: i64 0
```

4. Também a partir do analisador sintático, imprima os desvios de
fluxo e laços de repetição na sequência em que aparecem com
a manutenção do escopo. Para a Listagem 1, a saída seria a seguinte:

```
fatorial:
	if:
	while:
main:
```

5. Descreva como checar se uma variável, ao ser usada, já foi
  declarada. (Não é necessário especificar na gramática.)

6. Como projetista da linguagem, descreva como você faria
a geração de código. Esse código pode ser em *assembly*,
código intermediário em C, representação abstrata para
máquina virtual ou representação intermediária
para manipulação posterior, como o LLVM faz, por exemplo.
Descreva de forma abstrata e sucinta, sem necessidade
de geração de código.

O código da Listagem 1 pode ser usado como referência
nos testes. Se o arquivo contendo as regras léxicas chama-se 
`xyz.l`, com as regras gramáticais `xyz.y` e o 
código da Listagem 1 `fat.xyz`, os seguintes 
commandos podem ser executados:

```
lex -o xyz.yy.c xyz.l
yacc -d -o xyz.tab.c xyz.y
cc -o xyz xyz.tab.c
./xyz fat.xyz
```

Quaisquer regras gramaticais que possam surgir 
e que não estejam definidas neste documento,
podem ser arbitradas pelo desenvolvedor da
gramática.

Quaisquer dúvidas podem ser postadas como 
[*issue*](https://github.com/ajholanda/edu-compiladores/issues)
no repositório das práticas da disciplina, para que todos
tenham acesso às informações.
