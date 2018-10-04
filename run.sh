bison -d grammar_for_Lexical_analizer.y --verbose
flex lexical_analyzer.l
g++ -c lex.yy.c grammar_for_Lexical_analizer.tab.c
g++ -o parser lex.yy.o grammar_for_Lexical_analizer.tab.o -lfl -ly