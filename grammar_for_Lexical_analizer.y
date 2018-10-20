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
| input start_point
;

start_point: main_class_declaration class_declaration_list{
    cout << "start" << endl;
}
;

main_class_declaration:
    CLASS Identifier '{'  VOID MAIN '(' STRING '[' ']' ID ')' '{' Statement '}' '}'
        {
            cout << "main class declaration start!\n" << endl;
        }

class_declaration_list:
    /* empty */
    {
        cout << "class_dec_list empty";
    }
    | class_declaration class_declaration_list {
      		$$ = NULL;
    }

class_declaration:
    CLASS Identifier '{'  VarDeclarationList MethodDeclarationList '}' {
		$$ = NULL;
	}
	| CLASS Identifier EXTENDS Identifier '{'  VarDeclarationList MethodDeclarationList '}' {
		$$ = NULL;
    }

VarDeclarationList :
    /* empty */
    {
        cout << "empty var_list\n";
    }
    | VarDeclarationList VarDeclaration
    {
        cout << "var_list\n"
    }

VarDeclaration : Type ID ';'
{
    cout << "var declaration\n";
}

MethodDeclarationList :
    /* empty */
    {
        cout << "empty method_list\n";
    }
    | VarDeclarationList VarDeclaration
    {
        cout << "method_list\n"
    }

MethodDeclaration :
PUBLIC Type Identifier '(' ParameterList ')' '{' VarDeclarationList StatementList RETURN Expression ';' '}'
{
    cout << "Method declaration\n";
}

ParameterList:
    {
        $$ = NULL;
    }
    | Type Identifier ParameterEnumerateList
    {
        $$ = NULL;
    }

ParameterEnumerateList:
    {
        $$ = NULL;
    }
    | ParameterEnumerate ParameterEnumerateList
    {
        $$ = NULL;
    }

ParameterEnumerate:
    ',' Type Identifier

Type :
| INT '[' ']'
    {
        $$ = NULL;
    }
| BOOL
    {
        $$ = NULL;
    }
| INT
    {
        $$ = NULL;
    }
| Identifier
{
    cout << "Type declaration\n";
}

StatementList :
    /* empty */
    {
        cout << "empty statement_list\n";
    }
    | StatementList Statement
    {
        cout << "method_list\n"
    }


Statement:
            '{' StatementList '}'
           | IF '(' Expression ')' Statement ELSE Statement
           | WHILE '(' Expression ')' Statement
           | PRINTLN '(' Expression ')' ';'
           | Identifier '=' Expression ';'
           | Identifier '[' Expression ']' '=' Expression ';'
{
    cout << "statement\n";
}

Expression :
Expression  '<' Expression
| Expression '+' Expression
| Expression '-' Expression
| Expression '*' Expression
| Expression '.' LENGTH
| Expression '.' Identifier '(' ExpressionList ')'
| INTEGER_VAL
| BOOLEAN_VAL
| Identifier
| THIS
| NEW INT '[' Expression ']'
| NEW Identifier '(' ')'
| '(' Expression ')'
{
    cout << "expression\n";
}

Identifier: ID
{
    cout << "id";
}

ExpressionList:
    {
        $$ = NULL;
    }
| Expression ExpressionEnumerateList
    {
        $$ = NULL;
    }

ExpressionEnumerateList:
    {
        $$ = NULL;
    }
    | ExpressionEnumerate
    {
        $$ = NULL;
    }

ExpressionEnumerate:
    ',' Expression {
        $$ = NULL;
    }

