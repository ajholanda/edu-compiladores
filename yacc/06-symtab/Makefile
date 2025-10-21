CFLAGS := -Wall -g

symtab: symtab.tab.c
	$(CC) -o symtab symtab.tab.c

symtab.tab.c: symtab.y symtab.yy.c
	$(YACC) -t -d -o symtab.tab.c symtab.y

symtab.yy.c: symtab.l
	$(LEX) -o symtab.yy.c symtab.l

clean:
	$(RM) symtab symtab.yy.c symtab.tab.h symtab.tab.c
