# Análise léxica

1. Descreva o comportamento das expressões regulares a
seguir e dê alguns exemplos de *strings* que se encaixam em cada
padrão.

- `[+-]*[0-9]+\.[0-9]+`
- `[1-9][0-9]*|0`
- `[A-Z]+`
- `[a-zA-Z\_]+`
- `[a-zA-Z][a-zA-Z0-9\_]*`
- `[az-]+`
- `"[a-z]"`
- `[0-9]+[\t]*\*[\t]*[0-9]+`
- `x(cachorro|gato)x`
- `cachorro.*gato`
- `\tt [gato]`
- `[gato]+`
- `(ab|cd)?(ef)*`
- `(a|b)*a(a|b)`
- `(a|b)*a(a|b)(a|b)`
- `(a|b)*a(a|b)(a|b)(a|b)`
- `(abcd|abc)/d`
- `(a|ab)/ba`
- `aa*|a*`
- `[\^\+\-\:\*\]]`

2. Faça o diagrama de transição de estados das seguintes expressões regulares:

- `bababb`
- `while`
- `[a-z][a-zA-Z]*[0-9]`
- `[0-9]+(\.[0-9]*)?`

3. Implemente os seguintes programas usando o analisador léxico `lex`.

-  Imprima o número de palavras que comecem com letras maiúsculas
  de um texto fornecido pela entrada-padrão ou arquivo (daqui pra
  frente só texto fornecido).

- Imprima o número de letras maiúsculas, minúsculas e números de
  um texto fornecido.

- Imprima o número de vogais e consoantes de um texto fornecido.

- Que tenha comportamento parecido com o do programa
  [wc](https://pt.wikipedia.org/wiki/Wc) que imprime o número
  de caracteres (bytes), palavras (somente letras) e número de
  linhas de um texto fornecido.

- Encontre os números inteiros e de ponto flutuante a partir de um 
 texto fornecido. Implemente uma função chamada `install_num`, 
 que converta a *string*, que casa com as expressões regulares para números, 
 para número inteiro ou ponto flutuante e imprima-o na saída-padrão.

- A partir de um texto fornecido, imprima os valores existentes no
  texto em moeda brasileira, por exemplo, `R$ 12,50`,
  `R$312,78` ou `R$ 0,62`.  Se a entrada fornecida for

```
A calça original custa R$ 78,50, porém o terno custa em
torno de R$700,00 a   R$  1250,00. A camisa social sai
em torno de R$ 73,25. Se o pagamento for em cartão há
uma taxa adicional de R$ 0,80 a R$ 5,00.
```

o programa deverá imprimir

```
R$ 78,50
R$700,00
R$  1250,00
R$ 73,25
R$ 0,80
R$ 5,00
```

Dica: utilize um *buffer* (vetor de *strings*) para
armazenar os textos contendo os valores.

- Receba um arquivo contendo código fonte em C e imprima a quantidade de:


  - Palavras reservadas: `if`, `while` e `switch`;
  - Caracteres especiais: "`!`", "`@`", "`&`", "`|`", "`%`", "`$`" e "`#`".
  - Tipos de dados: `int`, `float`, `double`, `char` e `void`;
  - Números inteiros.

Após a compilação do programa e supondo que o binário gerado
chama-se `a.exe` (Windows) ou `a.out` (Linux),
forneça um arquivo com código C como argumento
da seguinte forma no terminal (PowerShell, bash, ...):

```
# Windows
.\a.exe arquivo.c
# Linux
./a.out arquivo.c
```

- (Adaptado de Aho, 2007) Que analise uma expressão SQL e
  reconheça as palavras-chave `SELECT`, `FROM` e `WHERE`
  em qualquer combinação de maiúsculas ou minúsculas, bem como os
  identificadores existentes na expressão.  Não há necessidade de
  adicionar o identificador em um tabela de símbolos, mas descreva
  como seria o tratamento dos identificadores levando em conta que a
  diferença entre maiúsculas e minúsculas é ignorada.

- (Adaptado de Levine, 2009). Receba uma expressão aritmética
na entrada-padrão e retorne os *tokens* correspondentes a cada
lexema: `'+'`, `'-'`, `'*'`, `'/'`, `'\n'` e números inteiros e reais.
\end{enumerate}
