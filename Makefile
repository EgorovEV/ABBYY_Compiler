# TODO директива для нахождения 'make'-ом install, uninstall;
# .PHONY: all clean install uninstall

CC = g++

all: compiller

clean: rm -rf  *.o

compiller: grammar_for_Lexical_analizer.y lexical_analyzer.l
	bison -d grammar_for_Lexical_analizer.y --verbose
	flex lexical_analyzer.l
	g++ -c lex.yy.c grammar_for_Lexical_analizer.tab.c
	g++ -o parser lex.yy.o grammar_for_Lexical_analizer.tab.o -lfl -ly

run:
	./parser