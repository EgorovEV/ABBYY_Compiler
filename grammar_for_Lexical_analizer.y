%{
    #include <cstdio>
    #include <string>
    #include <iostream>

    using namespace std;
    #define YYSTYPE string
    #define YYERROR_VERBOSE 1
    #define DEBUG

    int  wrapRet = 1;

    int yylex(void);
    extern "C" {
        int yywrap( void ) {
            return wrapRet;
        }
    }
    void yyerror(const char *str) {
        #ifdef DEBUG
          //cout << "mini-Java Parser: " << str << endl;
        #endif
    }
    int main();
%}
%token DOT COMMA LBRACE RBRACE CURLY_LBRACE CURLY_RBRACE
%token ID OTHER DEF CLASS DEFINED

%token INTEGER_VAL BOOLEAN_VAL VOID STRING INT BOOL
%token PRINTLN THIS NEW
%token WHILE IF RETURN EXTENDS LENGTH
%token PUBLIC STATIC MAIN
%token ELSE AND THEN


%start input
%%
input: /* empty */
     | input class_def
;
/* CLASS */
class_def: CLASS classname CURLY_LBRACE suite asdaejfgew
    {
        cout << " >> CLASS: "
             << $2            << "("
             << $3            << ")"
             << endl;
    }
;
classname: ID
           {
               $$ = $1;
           }
;


asdaejfgew: IF LBRACE suite
    {
        cout << "YOLO" << $$ << $1 << "end of new rule\n";
    }
/* TODO сформировать правила разбора LR(*) */





suite:
;
%%
int main()
{
    return yyparse();
}