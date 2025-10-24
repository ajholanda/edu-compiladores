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
- Só há dois tipos de dados na linguagem:
  | Tipo  | Descrição                  |
  | ----- | -------------------------- |
  | `i64` | Inteiro de 64 bits         |
  | `f64` | Ponto flutuante de 64 bits |

- Na avaliação booleana:
	-  `0` é considerado falso;
	- qualquer valor diferente de `0` corresponde ao booleano verdadeiro.
-  Os seguinte caracteres devem ser ignorados:
	-  Tabulação `'\t'`
 	-  Retorno de carro `'\r'`
  	-  Nova linha `'\n'`

**Restrições.** A linguagem é bem restrita, não havendo 
vetores, ponteiros e módulos. Todo o programa é definido em um 
único arquivo.

**Comentários.** Todos os comentários devem começar com "`//`".
Comentários de bloco (`/* ... */`) não são permitidos.

### Funções

**Sintaxe**

- Uma definição de função segue a forma:
   ``` 
  		fn nome(parâmetros) {
   			corpo (lista de proposições)
   		}
   ```
- Exemplo:
	```
		fn foo(a: i64, b: f64) {
    		var x: i64 = a + 1;
    		return x;
		}
 	```
#### Regras

- Toda função deve retornar (`return`) um valor, mesmo que este não seja utilizado.
- O retorno é realizado com o comando return expressão.
- Parâmetros são separados por vírgula e declarados na forma `nome: tipo`.
- Não há funções recursivas nem variáveis globais.

### Declarações de Variáveis

- As variáveis devem ser declaradas antes de serem usadas.
- Uma declaração inicia pela palavra reservada var e contém uma ou mais variáveis separadas por vírgula.
- Cada variável deve possuir um valor inicial.
	- Exemplo:
	```
		var a: i64 = 10, b: f64 = 3.5;
 	```
- A sintaxe geral é:
```
var nome: tipo = expressão [, nome: tipo = expressão] ;
```

### Identificadores

Um identificador é formado por:
- uma letra (A–Z ou a–z),
- opcionalmente seguida por letras, dígitos (0–9) e sublinhado (_).

Expressão regular sugerida:
```
[a-zA-Z][a-zA-Z0-9_]*
```

### Expressões

As seguintes expressões são válidas:
- Literais: `123`, `3.14`
- Variáveis: `x`, `y`
- Chamadas de função: `foo(a, b)`
- Expressões os operadores:
  	- Aritméticos: ` + - * / %`
  	- Comparação:  `> < >= <= == !=`
  	- Lógicos: `&& ||`
  	- Atribuição: `=`
	- Unários: `+ - ~ ! ++ --`

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

#### Estruturas de Controle

- If:
```
if condição {
    ...
} else {
    ...
}
```

O bloco else é opcional.
Não há else if.

- While:

```
while condição {
    ...
}
```

### Exemplo de programa

A Listagem 1 mostra o código para o cálculo 
do fatorial como um exemplo de aplicação da linguagem 
`xyz`.

```
// fat.xyz
fn fatorial(n: i64) {
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

1. Escreva um analisador léxico usando o `lex`
para a linguagem;
2. Escreva um analisador sintático usando o `yacc`;
3. A partir do analisador sintático, imprima a tabela de 
símbolos para o código de entrada com os símbolos apresentados 
de acordo com o contexto. Por exemplo, para a Listagem 1
a saída da execução do compilador seria parecida com:

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

### Observações finais

O código da Listagem 1 pode ser usado como referência
nos testes. Se o arquivo contendo as regras léxicas chama-se 
`xyz.l`, com as regras gramaticais `xyz.y` e o 
código da Listagem 1 `fat.xyz`, os seguintes 
comandos podem ser executados:

```
lex -o xyz.yy.c xyz.l
yacc -d -o xyz.tab.c xyz.y
cc -o xyz xyz.tab.c
./xyz fat.xyz
```
Um arquivo [Makefile](Makefile) pode ser usado para facilitar o fluxo de compilação.

Quaisquer regras gramaticais que possam surgir 
e que não estejam definidas neste documento,
podem ser arbitradas pelo desenvolvedor da
gramática, desde que mantenham coerência sintática
com a gramática.

Quaisquer dúvidas podem ser postadas como 
[*issue*](https://github.com/ajholanda/edu-compiladores/issues)
neste repositório, para que todos tenham acesso às informações.
