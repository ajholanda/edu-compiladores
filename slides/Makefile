LATEX := xelatex
ifeq ($(OS),Windows_NT)
	RM := del
	DEV_NULL := 2> $$null
else
	DEV_NULL := 2>/dev/null
endif

main.pdf: main.tex $(wildcard *.png) $(wildcard *.tex)
	$(LATEX) $< && $(LATEX) $<

clean:
	$(RM) -v main.aux  main.out  main.log \
		 main.pdf  main.toc main.nav  \
		 main.snm  main.vrb $(DEV_NULL)

.PHONY: clean
