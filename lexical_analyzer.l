%{
    #include <string>
    #include <iostream>

    using namespace std;

    #define YYSTYPE string
    #include "grammar_for_Lexical_analizer.tab.h"
%}

identifier      [_a-zA-Z][_a-zA-Z0-9]*

%%

SHUT_DOWN       {
                    yylval = yytext;
                    printf("SHUT_DOWN");
                    return SHUT_DOWN;
                }

[\n\r|\r\n|\n|\r]   {
                    printf("new_line \n");
                    /* skip empty line */
                    }
['<'|'+'|'-'|'*'|'%']  {
                                yylval = yytext;
                                printf("MATH_OR_LOGICAL_SYMBOL %s\n", yytext);
                                return yytext[0];
                            }

"||"            {
                    printf("OR %s", yytext);
                    return OR;
                }

class           {

                    yylval = yytext;
                    printf("class\n");
                    return CLASS;
                }


[ \t]+          ; /* skip whitespaces */

if                      {printf("IF ");	return IF;	}
else		            {printf("ELSE ");	return ELSE;	}
while		            {printf("WHILE ");	 return WHILE;	}
return		            {printf("RETURN ");	 return RETURN;	}
extends		            {printf("EXTENDS ");	 return EXTENDS; }
public		            {printf("PUBLIC \n");	 return PUBLIC;	}
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
[-+*/{}()\]\[!;,=.<]    { printf("math_symbol: %s\n", yytext); return yytext[0]; }

{identifier}    {
                    yylval = yytext;
                    printf("id %s \n", yytext);
                    return ID;
                }

.               {
                    yylval = yytext;
                    printf("OTHER %s\n", yytext);
                    return OTHER;
                }
%%
