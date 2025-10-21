CC := gcc
YACC := bison
LEX := flex
CFLAGS := -Wall -g
LDFLAGS += 
PROJ := calc

# flex+bison only binary
$(PROJ): $(PROJ).tab.c $(PROJ).yy.c
	$(CC) $< $(CFLAGS) -o $@ $(LDFLAGS)

$(PROJ).tab.h $(PROJ).tab.c: $(PROJ).y
	$(YACC) -d $<

$(PROJ).yy.c: $(PROJ).l $(PROJ).tab.h
	$(LEX) -o $@ $<

clean:
	$(RM) $(PROJ).yy.c $(PROJ).tab.c $(PROJ).tab.h $(PROJ)
