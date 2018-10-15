%{
    #include <string>
    #include <iostream>

    using namespace std;

    #define YYSTYPE string
    #include "grammar_for_Lexical_analizer.tab.h"
    extern bool print_flex;
%}

identifier      [_a-zA-Z][_a-zA-Z0-9]*
expression      "<"|"+"|"-"|"*"|"%"|"||"

%%

SHUT_DOWN       {
                    yylval = yytext;
		    if(print_flex)
                    printf("SHUT_DOWN");
                    return SHUT_DOWN;
                }

\n\r|\r\n|\n|\r {
                    /* skip empty line */
                }
{expression}    {
                    yylval = yytext;
		    if(print_flex)
                    printf("DEFINED ");
                    return DEFINED;
                }
class           {

                    yylval = yytext;
		    if(print_flex)
                    printf("class ");
                    return CLASS;
                }

"."             {   yylval = yytext; 
		    if(print_flex)
			printf("DOT" ); 
		    return DOT;            
		}
","             {   yylval = yytext; 
		    if(print_flex)
			printf("COMMA "); 
		    return COMMA;          }
"("             {   yylval = yytext; 
		    if(print_flex)
			printf("LBRACE "); 
		    return LBRACE;         }
")"             {   yylval = yytext; 
		    if(print_flex)
			printf("RBRACE "); 
		    return RBRACE;         }
"{"             {   yylval = yytext; 
		    if(print_flex)
			printf("CURLY_LBRACE "); 
		    return CURLY_LBRACE;   }
"}"             {   yylval = yytext; 
		    if(print_flex)
			printf("CURLY_BRACE "); 
		    return CURLY_RBRACE;   }

{identifier}    {
                    yylval = yytext;
		    if(print_flex)
                       printf("id ");
                    return ID;
                }


[ \t]+          ; /* skip whitespaces */

if                      {
		    if(print_flex)
			printf("IF ");	
		    return IF;	}
else		            {
		    if(print_flex)
			printf("ELSE ");	
		    return ELSE;	}
while		            { if(print_flex) printf("WHILE ");	 return WHILE;	}
return		            { if(print_flex) printf("RETURN ");	 return RETURN;	}
extends		            { if(print_flex) printf("EXTENDS ");	 return EXTENDS; }
public		            { if(print_flex) printf("PUBLIC ");	 return PUBLIC;	}
static		            { if(print_flex) printf("STATIC ");	 return STATIC;	}
void		            { if(print_flex) printf("VOID ");	 return VOID;	}
main		            { if(print_flex) printf("MAIN ");	 return MAIN;	}
int 		            { if(print_flex) printf("INT ");    return INT;	}
boolean		            { if(print_flex) printf("BOOL ");    return BOOL;	}
String		            { if(print_flex) printf("STRING ");	 return STRING;	}
System.out.println	    { if(print_flex) printf("PRINTLN ");	 return PRINTLN;	}
this		            { if(print_flex) printf("THIS ");	 return THIS;	}
length		            { if(print_flex) printf("LENGTH ");	 return LENGTH;	}
new			            { if(print_flex) printf("NEW ");	 return NEW;	}
"&&"		            { if(print_flex) printf("AND ");	 return AND;	}
"true"|"false"		    { if(print_flex) printf("BOOLEAN_VAL ");	yylval = yytext; return BOOLEAN_VAL; }
[0-9]+		            { if(print_flex) printf("INTEGER_VAL ");	yylval = yytext; return INTEGER_VAL; }
[/][/].*\n              {  } // comment

.               {
                    yylval = yytext;
                     if(print_flex) printf("OTHER ");
                    return OTHER;
                }
%%
