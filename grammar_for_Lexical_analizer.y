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
%start input
%%
input: /* empty */
     | input class_def
;
/* CLASS */
class_def: CLASS classname CURLY_LBRACE suite
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

suite:
;
%%
int main()
{
    return yyparse();
}