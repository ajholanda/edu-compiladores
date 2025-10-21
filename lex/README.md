# Análise léxica usando `lex` &#8594; `flex`

## Fluxo de Compilação

### Windows

Abra o PowerShell e entre no diretório que contém os arquivos com os códigos e execute:

```
PS ...\compiladores\lex> win_flex -o a.yy.c a.l

PS ...\compiladores\lex> gcc -o a.exe a.yy.c

PS ...\compiladores\lex> .\a.exe [arquivo_de_entrada]
```

### Linux

Abra o `bash` e entre no diretório que contém os arquivos com os códigos e execute:

```
.../compiladores/src$ flex -o a.yy.c a.l

.../compiladores/src$ gcc -o a a.yy.c

.../compiladores/src$ ./a [arquivo_de_entrada]
```

A diretiva `%option yynowrap` é usada na seção de definições dos
arquivos `flex` para não precisar usar a biblioteca `libfl.so` durante
a compilação do código C gerado. Este procedimento também evita que o
aviso "`warning: 'yyunput' defined but not used`" seja lançado, pois se
a biblioteca do `flex` for ligada ao executável, a variável global
`yyunput` supostamente deveria ser usada.

---
