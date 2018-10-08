%{
    #include <string>
    #include <iostream>

    using namespace std;

    #define YYSTYPE string
    #include "grammar_for_Lexical_analizer.tab.h"
%}

identifier      [_a-zA-Z][_a-zA-Z0-9]*
expression      "<"|"+"|"-"|"*"|"%"|"||"

%%
\n\r|\r\n|\n|\r {
                    /* skip empty line */
                }
{expression}    {
                    yylval = yytext;
                    return DEFINED;
                }
class           {
                    yylval = yytext;
                    return CLASS;
                }

"."             {   yylval = yytext; return DOT;            }
","             {   yylval = yytext; return COMMA;          }
"("             {   yylval = yytext; return LBRACE;         }
")"             {   yylval = yytext; return RBRACE;         }
"{"             {   yylval = yytext; return CURLY_LBRACE;   }
"}"             {   yylval = yytext; return CURLY_RBRACE;   }

{identifier}    {
                    yylval = yytext;
                    return ID;
                }


[ \t]+          ; /* skip whitespaces */
.               {
                    yylval = yytext;
                    return OTHER;
                }
if                      {	return IF;	}
else		            {	return ELSE;	}
while		            {	 return WHILE;	}
return		            {	 return RETURN;	}
extends		            {	 return EXTENDS; }
public		            {	 return PUBLIC;	}
static		            {	 return STATIC;	}
void		            {	 return VOID;	}
main		            {	 return MAIN;	}
int 		            {    return INT;	}
boolean		            {    return BOOL;	}
String		            {	 return STRING;	}
System.out.println	    {	 return PRINTLN;	}
this		            {	 return THIS;	}
length		            {	 return LENGTH;	}
new			            {	 return NEW;	}
"&&"		            {	 return AND;	}
"true"|"false"		    {	yylval = yytext; return BOOLEAN_VAL; }
[0-9]+		            {	yylval = yytext; return INTEGER_VAL; }
[/][/].*\n              {  } // comment

%%
