%{
    #include <cstdio>
    #include <string>
    #include <iostream>

    using namespace std;
    #define YYSTYPE string
    #define YYERROR_VERBOSE 1
    #define DEBUG

    int  wrapRet = 1;
    bool print_bison = false;
    bool print_flex = false;

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
    int main(int, char **);
%}
%token SHUT_DOWN
%token CLASS
%token ID DOT COMMA LBRACE RBRACE CURLY_LBRACE CURLY_RBRACE
%token OTHER DEF  DEFINED
%token WHILE RETURN EXTENDS PUBLIC STATIC VOID MAIN INT BOOL STRING PRINTLN THIS
%token LENGTH  NEW AND BOOLEAN_VAL INTEGER_VAL
%token IF ELSE variable  /* Solve If-else conflict */
%start input
%%
input: /* empty */
| input tmp_start
;

tmp_start:
    | class_def
    | id_tmp
    | comma_tmp
    | lbrace_tmp
    | if
    | ending_process
;

ending_process: SHUT_DOWN
    {
	if(print_bison)
            cout << "SHUT_DOWN" << $1 << endl;
    }
;

if:
        | IF expr stmt
        | IF expr stmt ELSE stmt
;

expr: DEFINED
    {
	if(print_bison)
        	cout << "find some expr inside if! (not done yet)" << $1 << endl;
    }
;

stmt: DEFINED
    {
	if(print_bison)
        	cout << "find some statement inside else! (not done yet)" << $1 << endl;
    }
;

/* CLASS */
class_def: CLASS classname CURLY_LBRACE suite
    {
	if(print_bison)
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

id_tmp: ID
    {
	if(print_bison)
        cout << "find id: " << $1 << endl;
    }
;

comma_tmp: COMMA
    {
	if(print_bison)
        cout << "find comma: " << $1 << endl;
    }
;

lbrace_tmp: LBRACE
    {
	if(print_bison)
        cout << "find lbrace: " << $1 << endl;
    }
;

suite:
;
%%
int main(int argc, char **argv)
{
    for(int i = 1; i < argc; ++i) 
    {
	if(std::string(argv[i]) == "-pl") 
        {
	    print_flex = true;
	}
	if(std::string(argv[i]) == "-pb") 
        {
	    print_bison = true;
	}
    }
    return yyparse();
}

/* RBRACE CURLY_LBRACE CURLY_RBRACE OTHER DEF  DEFINED IF ELSE WHILE RETURN EXTENDS PUBLIC STATIC VOID MAIN INT BOOL STRING PRINTLN THIS LENGTH  NEW AND BOOLEAN_VAL INTEGER_VAL*/
