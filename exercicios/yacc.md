# Análise sintática com yacc (bison)

## Exercícios

1. Para a gramática da calculadora de mesa simples

E $\rightarrow$  E + T  | T

T $\rightarrow$ T * F  | F

F $\rightarrow$ ( E )  | **digit**


Faça a tabela de reduções e deslocamentos usando o *parser* SLR(1), listando os
valores da entrada e pilha a cada ação para as seguintes expressões:


a. `1 + 2`

b. `1 * 2 + 5`

c. `1 * 2 + 5 * 3`

d. `1 * 2 + 5 + 3`

e. `1 * (2 + 5) + 3`

f. `1 * 2 + 5 + 3 * 4`

g. `1 * 2 + 5 * (3 + 4)`

2. Escreva um programa de "calculadora de mesa" usando o `yacc` que avalie
expressões aritméticas usando a [notação polonesa inversa](https://pt.wikipedia.org/wiki/Nota%C3%A7%C3%A3o_polonesa_inversa).
 [[Solução](../yacc/03-calc)]

3. Escreva um programa de "calculadora de mesa" usando o `yacc`
que avalie expressões aritméticas usando a notação da linguagem
[LISP](https://pt.wikipedia.org/wiki/Lisp), com a lista limitada
a dois operandos. Por exemplo, a expressão

```
(/ (* (- 3 1) 4) 2)
```

tem como sequência de avaliação

```
(/ (* 2 4) 2) =
(/ 8 2) =
4
```

[[Solução](../yacc//04-calc)]

4. [Aho] Escreva um programa de "calculadora de mesa" usando o
`yacc` que avalie expressões Booleanas tendo as operações
representadas pelos caracteres


- `'|'` -> `OR`,
- `&` -> `AND`,
- `^` -> `XOR`,
- `~` -> `NOT`.

O operador unário $\sim$ possui maior
precedência sobre os demais operadores, sendo que estes possuem mesma
precedência excetuando se a expressão estiver entre parênteses. Por
exemplo, a expressão

```
0 ^ (1 | 0) | ~0
```

tem como sequência de avaliação

```
0 ^ (1 | 0) | 1 =
0 ^ 1 | 1 =
1 | 1 =
1
```

[[Solução](../yacc/05-bool)]
