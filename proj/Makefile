CFLAGS := -Wall -g
PROG := xyz

$(PROG): $(PROG).tab.c
	$(CC) -o $(PROG) $(PROG).tab.c

$(PROG).tab.c: $(PROG).y $(PROG).yy.c
	$(YACC) -t -d -o $(PROG).tab.c $(PROG).y

$(PROG).yy.c: $(PROG).l
	$(LEX) -o $(PROG).yy.c $(PROG).l

clean:
	$(RM) $(PROG) $(PROG).yy.c $(PROG).tab.h $(PROG).tab.c
