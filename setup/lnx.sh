#!/usr/bin/env bash

# Mude para o nome do instalador do sistema
PKG='apt'

sudo $PKG install \
     bison flex gcc- gdb \
     nasm make pandoc snapd

sudo snap install code
