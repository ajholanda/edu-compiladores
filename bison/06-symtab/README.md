# Tabela de símbolos

O _parser_ especificado avalia expressões aritméticas e atribuições, 
armazenando o valor das variáveis em uma tabela de símbolos. Por exemplo, 
a sequência de expressões

```
a=1;


b = 3 * 8 + 2;
c = 12 + 4;
```

resultaria em uma tabela de símbolos com as variáveis `x`, `b` e 
`c` e os valores `1`, `26` e `16` atribuídos para as variáveis 
na tabela. As atribuições são terminadas com o caracter ';' e 
as variáveis só devem possuir um caracter.

O arquivo [arg1.txt](arg1.txt) pode ser fornecido como entrada para 
o programa para a realização de testes.
