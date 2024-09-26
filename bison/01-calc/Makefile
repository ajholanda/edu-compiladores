CFLAGS := -Wall -g

calc: calc.tab.c
	$(CC) -o calc calc.tab.c

calc.tab.c: calc.y calc.yy.c
	$(YACC) -t -d -o calc.tab.c calc.y

calc.yy.c: calc.l
	$(LEX) -o calc.yy.c calc.l

clean:
	$(RM) calc calc.yy.c calc.tab.h calc.tab.c
