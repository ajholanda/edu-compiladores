# Compiladores (`lex` + `yacc`)

## Recursos Didáticos

- `yacc`: [exercícios](https://drive.google.com/file/d/1oLPe0OWjDwQbWOt0_THAbiwn3MoAZhIE/view?usp=sharing), 
[slides](https://drive.google.com/file/d/1nkz2ERd3uo0wONgNEiYpa7niGEi3dEs-/view?usp=sharing).
- `lex`: [exercícios](https://drive.google.com/file/d/1nUIRZ4Wdv9Y3K-DrIPcgCxeZ0PT3npQQ/view?usp=sharing), [slides](https://drive.google.com/file/d/1Sf4hlcPEDvNH3PQez9--1zATqZLPjZSl/view?usp=sharing).

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

A instância contém todos os programas necessários para compilação dos arquivos.

# Dicas

- [Guia de instalação do Subsistema Windows para Linux para Windows 10](https://docs.microsoft.com/pt-br/windows/wsl/install-win10).
- Como instalar o [Windows Terminal](https://www.microsoft.com/pt-br/p/windows-terminal/9n0dx20hk701) para executar comandos `Unix`-like com mais facilidade.
-  Brian Kernighan, [UNIX: A History and a Memoir](https://www.amazon.com.br/UNIX-History-English-Brian-Kernighan-ebook/dp/B07ZQHX3R1):
Livro que narra a história do desenvolvimento do Sistema Operacional `Unix` por quem participou ativamente
do processo. Neste livro é descrito com detalhes o surgimento do `lex` e `yacc`.
- [Chocolatey](https://chocolatey.org/): gerenciador de instalação de programas para Windows.
- [VS Code](https://code.visualstudio.com/download): editor usado nas demonstrações e aulas.
- [Mingw](https://www.mingw-w64.org/): projeto contendo o `gcc` para Windows. Porém, qualquer compilador C pode ser usado, dentre eles: [`tcc`](https://bellard.org/tcc/) e
[`clang`](https://clang.llvm.org/).
- [winflexbison](https://github.com/lexxmark/winflexbison/releases): projeto de portabilidade do `flex` e `bison` para Windows.

---
