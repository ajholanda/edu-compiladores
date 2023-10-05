# Análise sintática usando `yacc` &#8594; `bison`

## Material didático

### Slides 

- [`yacc` &#8594; `bison`](https://docs.google.com/presentation/d/1yaMEEI7Q1ex6kU09wRmSz-zObbanBRyoNeKI4_1leYg/edit?usp=sharing);
- [Tabela de símbolos](https://docs.google.com/presentation/d/1lye-g04QgQQtZe3m0Qvq7T-xVPJ2DRHSEjJkLRZjVlg/edit?usp=sharing).
- [Geração de código](https://docs.google.com/presentation/d/1rpuhGsr91s-BAV-3XGWOEvhqtgWB4aIeLDlBAiyRy9E/edit?usp=sharing).

## Fluxo de Compilação

### Windows

Abra o PowerShell e entre no diretório que contém os arquivos com os códigos e execute:

```
PS ...\compiladores\yacc\01-calc> flex calc.l

PS ...\compiladores\yacc\01-calc> bison -d calc.y

PS ...\compiladores\yacc\01-calc> gcc -o calc.exe calc.tab.c

PS ...\compiladores\yacc\01-calc> .\calc.exe
```

### Linux

Abra o `bash` e entre no diretório que contém os arquivos com os códigos e execute:

```
.../compiladores/yacc/01-calc$ flex calc.l

.../compiladores/yacc/01-calc$ bison -d calc.y

.../compiladores/yacc/01-calc$ gcc -o calc calc.tab.c

.../compiladores/yacc/01-calc$ ./calc
```

---
[Adriano J. Holanda](https://ajholanda.github.io/)