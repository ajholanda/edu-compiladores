# Calculadora de mesa simples

O código deste diretório contém o analisador sintático 
para a construção de uma calculadora de mesa com a 
seguinte gramática para expressões aritméticas:

`E` &#8594; `E + T | T` <br>
`T` &#8594; `T * F | F` <br>
`F` &#8594; `(E) | DIGIT` <br>

onde o _token_ `DIGIT` é um único dígito entre 0 e 9.

O enunciado

```
%token DIGIT
```

declara `DIGIT` como um __token__ que pode ser usado na segunda e 
terceira parte da especificação.

No `yacc` a gramática

`E` &#8594; `E + T | T` <br>

podem ter suas ações semânticas associadas como

```
expr    : expr '+' term { $$ = $1 + $3; }
        | term
        ;
```

A produção não-terminal `expr '+' term` possui a ação 
semântica `$$ = $1 + $3` que atribui `$1` &#8592; `expr` 
(primeiro termo) e `$3` &#8592; `term` (terceiro termo) 
e a soma é atribuída para `$$`.

---
O material contido neste diretório foi adaptado do livro ["Compiladores..."](https://www.amazon.com.br/dp/B00US12GMG).

