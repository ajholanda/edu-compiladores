CC := gcc
LEX := flex
YACC = bison
CFLAGS := -Wextra -Wall -g
LDFLAGS :=
PROG := xyz

$(PROG): $(PROG).tab.c
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(PROG).tab.c: $(PROG).y $(PROG).yy.c
	$(YACC) -t -d -o $@ $<

$(PROG).yy.c: $(PROG).l
	$(LEX) -o $@ $<

clean:
	$(RM) $(PROG) $(PROG).yy.c $(PROG).tab.h $(PROG).tab.c
