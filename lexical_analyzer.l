%{
    #include <string>
    #include <iostream>

    using namespace std;

    #define YYSTYPE string
    #include "grammar_for_Lexical_analizer.tab.h"
%}

identifier      [_a-zA-Z][_a-zA-Z0-9]*
expression      "&&"|"<"|"+"|"-"|"*"|"%"|"||"|"true"|"false"|"this"

%%
\n\r|\r\n|\n|\r {
                    /* skip empty line */
                }
"//"            {
                    /* skip comment */
                }
{expression}    {
                    yylval = yytext;
                    return DEFINED;
                }
class           {
                    yylval = yytext;
                    return CLASS;
                }
def             {
                    yylval = yytext;
                    return DEF;
                }

"."             yylval = yytext; return DOT;
","             yylval = yytext; return COMMA;
"("             yylval = yytext; return LBRACE;
")"             yylval = yytext; return RBRACE;
"{"             yylval = yytext; return CURLY_LBRACE;
"}"             yylval = yytext; return CURLY_RBRACE;

{identifier}    {
                    yylval = yytext;
                    return ID;
                }


[ \t]+          ; /* skip whitespaces */
.               {
                    yylval = yytext;
                    return OTHER;
                }
%%
