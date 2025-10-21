# Calculadora de mesa avançada

O código deste diretório contém o analisador sintático 
para a construção de uma calculadora de mesa avançada com a 
seguinte gramática __ambígua__ para expressões aritméticas:

`E` &#8594; `E + E | E - E | E * E | E / E | (E) | -E | NUMBER`

onde o _token_ `NUMBER` &#x2208; &#x211D;.

A declaração

```
$left '+" '-'
```

faz com que `+` e `-` tenham a mesma precedência e sejam associativos
à esquerda.

A declaração

```
%right NEG
```

atribui uma precedência maior do que a de `*` e `/`. Na tradução, 
o rótulo

```
%prec NEG
```

ao final da produção

```
expr    : '-' expr %prec NEG
```

faz com que o operador menos unário tenha precedência maior do que 
qualquer outro operador.

---
O material contido neste diretório foi adaptado do livro ["Compiladores..."](https://www.amazon.com.br/dp/B00US12GMG).

