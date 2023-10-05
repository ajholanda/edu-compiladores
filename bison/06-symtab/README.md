# Tabela de símbolos

O _parser_ especificado avalia expressões aritméticas e atribuições, 
armazenando o valor das variáveis em uma tabela de símbolos. Por exemplo, 
a sequência de expressões

```
a=1;


b = 3 * 8;
c = 12 + 4;
```

resultaria em uma tabela de símbolos com as variáveis `x`, `b` e 
`c` e os valores `1`, `24` e `16` atribuídos para as variáveis 
na tabela.

Algumas restrições foram impostas:

- A atribuição só pode ser feita a partir de um número ou uma única 
operação aritmética, uma avaliação do tipo `d = 3 + 2 * 4` não 
é permitida.
- As atribuições são terminadas com o caracter ';'.

O arquivo [arg1.txt](arg1.txt) pode ser fornecido como entrada para 
o programa para a realização de testes.
