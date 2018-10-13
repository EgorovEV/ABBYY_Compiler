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

SHUT_DOWN       {
                    yylval = yytext;
                    printf("SHUT_DOWN");
                    return SHUT_DOWN;
                }

\n\r|\r\n|\n|\r {
                    /* skip empty line */
                }
{expression}    {
                    yylval = yytext;
                    printf("DEFINED ");
                    return DEFINED;
                }
class           {

                    yylval = yytext;
                    printf("class ");
                    return CLASS;
                }

"."             {   yylval = yytext; printf("DOT" ); return DOT;            }
","             {   yylval = yytext; printf("COMMA "); return COMMA;          }
"("             {   yylval = yytext; printf("LBRACE "); return LBRACE;         }
")"             {   yylval = yytext; printf("RBRACE "); return RBRACE;         }
"{"             {   yylval = yytext; printf("CURLY_LBRACE "); return CURLY_LBRACE;   }
"}"             {   yylval = yytext; printf("CURLY_BRACE "); return CURLY_RBRACE;   }

{identifier}    {
                    yylval = yytext;
                    printf("id ");
                    return ID;
                }


[ \t]+          ; /* skip whitespaces */

if                      {printf("IF ");	return IF;	}
else		            {printf("ELSE ");	return ELSE;	}
while		            {printf("WHILE ");	 return WHILE;	}
return		            {printf("RETURN ");	 return RETURN;	}
extends		            {printf("EXTENDS ");	 return EXTENDS; }
public		            {printf("PUBLIC ");	 return PUBLIC;	}
static		            {printf("STATIC ");	 return STATIC;	}
void		            {printf("VOID ");	 return VOID;	}
main		            {printf("MAIN ");	 return MAIN;	}
int 		            {printf("INT ");    return INT;	}
boolean		            {printf("BOOL ");    return BOOL;	}
String		            {printf("STRING ");	 return STRING;	}
System.out.println	    {printf("PRINTLN ");	 return PRINTLN;	}
this		            {printf("THIS ");	 return THIS;	}
length		            {printf("LENGTH ");	 return LENGTH;	}
new			            {printf("NEW ");	 return NEW;	}
"&&"		            {printf("AND ");	 return AND;	}
"true"|"false"		    {printf("BOOLEAN_VAL ");	yylval = yytext; return BOOLEAN_VAL; }
[0-9]+		            {printf("INTEGER_VAL ");	yylval = yytext; return INTEGER_VAL; }
[/][/].*\n              {  } // comment

.               {
                    yylval = yytext;
                    printf("OTHER ");
                    return OTHER;
                }
%%