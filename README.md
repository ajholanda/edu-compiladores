# Compiladores (`lex` + `yacc`)

## Recursos Didáticos

- [Texto do trabalho sobre yacc](./proj/README.md) (Análisador sintático - *parser*).
- Parser LALR(1) e `yacc`: [exercícios](./exercicios/yacc.md), [slides](https://drive.google.com/file/d/169g7wzoAX_NbevCz-KoruCIsvPtj821e/view?usp=sharing).
- `lex`: [exercícios](https://drive.google.com/file/d/19C753Z-0h0hborx7PcxvgWmSTw0GQ2ct/view?usp=sharing), [slides](https://drive.google.com/file/d/1xpTNwOqVL5dnu9XB7Y8XJ3rmWlpclUoJ/view?usp=sharing).

## Setup

### Windows

1. Abra o PowerShell como **Administrador** e execute o comando a seguir
para permitir que _scripts_ sem assinatura digital sejam executados:

```
Set-ExecutionPolicy RemoteSigned
```

2. Execute o comando a seguir no PowerShell para instalar os programas
a serem usados:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ajholanda/edu-compiladores/main/setup/win.ps1'))
```

- [Vídeo no Youtube demonstrando o processo de setup do Windows passo a passo](https://youtu.be/p8euvHbGVxc).

### Linux

Execute os seguintes comandos no terminal:

```
git clone https://github.com/ajholanda/edu-compiladores
cd edu-compiladores/setup
bash lnx.sh
```

O script foi testado no Debian/Ubuntu, talvez algumas alterações tenham que ser feitas para outras distribuições.


## Docker

Execute os comandos (bash ou PowerShell) a seguir para criar um contêiner 
e executar a instância com os códigos do flex e bison:

```
$ docker build --rm . -t bison-image
$ docker run --rm -it --entrypoint bash bison-image
```

A instância contém todos os programas necessários para compilação dos arquivos
que são copiados para os diretórios `/home/flex` e `/home/bison`.

## Vagrant

Execute os comandos (bash ou PowerShell) a seguir para criar uma
máquina virtual [Vagrant](https://www.vagrantup.com/) 
com os programas e códigos usados na disciplina:

```
$ vagrant up
$ vagrant ssh  # Se pedir senha digite "vagrant".
$ cd compiladores
```

O conteúdo deste repositório é mapeado para o diretório `compiladores`.

# Dicas

- [Guia de instalação do Subsistema Windows para Linux para Windows](https://learn.microsoft.com/pt-br/windows/wsl/install).
- Como instalar o [Windows Terminal](https://www.microsoft.com/pt-br/p/windows-terminal/9n0dx20hk701) para executar comandos `Unix`-like com mais facilidade.
-  Brian Kernighan, [UNIX: A History and a Memoir](https://www.amazon.com.br/UNIX-History-English-Brian-Kernighan-ebook/dp/B07ZQHX3R1):
Livro que narra a história do desenvolvimento do Sistema Operacional `Unix` por quem participou ativamente
do processo. Neste livro é descrito com detalhes o surgimento do `lex` e `yacc`.
- [Chocolatey](https://chocolatey.org/): gerenciador de instalação de programas para Windows.
- [VS Code](https://code.visualstudio.com/download): editor usado nas demonstrações e aulas.
- [Mingw](https://www.mingw-w64.org/): projeto contendo o `gcc` para Windows. Porém, qualquer compilador C pode ser usado, dentre eles: [`tcc`](https://bellard.org/tcc/) e
[`clang`](https://clang.llvm.org/).
- [winflexbison](https://github.com/lexxmark/winflexbison/releases): projeto de portabilidade do `flex` e `bison` para Windows.
- [Compiler Explorer](https://godbolt.org/): gera código para diversas plataformas.

---
