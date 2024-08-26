ifeq ($(OS),Windows_NT)
	FLEX := win_flex
	BISON := win_bison
	CC := gcc
	BIN_EXT = .exe
	DEV_NULL := 2> $$null
	RM = del
else
	FLEX := flex
	BISON := bison
	BIN_EXT := ""
	DEV_NULL := 2>/dev/null
endif

BINS := $(patsubst %.l,%$(BIN_EXT), $(wildcard *.l))

default: $(BINS)

# flex
%.yy.c: %.l
	$(FLEX) -o $@ $<

# flex-only binaries
%$(BIN_EXT): %.yy.c
	$(CC) $< $(CFLAGS) -o $@ $(LDFLAGS)

# bison
%.tab.c: %.y
	$(BISON) -d $< -o $@

clean:
	$(RM) *.exe $(DEV_NULL)
	$(RM) *.o $(DEV_NULL)
	$(RM) *.tab.c $(DEV_NULL)
	$(RM) *.yy.c $(DEV_NULL)
	$(RM) *~ $(DEV_NULL)
	$(RM) $(BINS)
	$(RM) $$null

.PHONY: clean
