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

%union {
    char* val;
}

%token SHUT_DOWN
%token CLASS
%token ID DOT COMMA LBRACE RBRACE CURLY_LBRACE CURLY_RBRACE
%token OTHER DEF  DEFINED
%token WHILE RETURN EXTENDS PUBLIC STATIC VOID MAIN INT BOOL STRING PRINTLN THIS
%token LENGTH  NEW AND BOOLEAN_VAL INTEGER_VAL
%token IF ELSE variable  /* Solve If-else conflict */


%type <val> start_point main_class_declaration class_declaration_list class_declaration
VarDeclarationList VarDeclaration ExpressionEnumerate StatementList
MethodDeclarationList ParameterEnumerateList ParameterEnumerate Type Statement
Expression ExpressionList ExpressionEnumerateList
Identifier INTEGER_VAL BOOLEAN_VAL



%left AND
%left '<' '='
%left '+' '-'
%left '*' '/'
%left UMINUS
%left '!'
%left '.' '[' ']'

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
    | class_declaration_list class_declaration{
      		cout << " \n";
    }

class_declaration:
    CLASS Identifier '{'  VarDeclarationList MethodDeclarationList '}' {
		cout << " \n";
	}
	| CLASS Identifier EXTENDS Identifier '{'  VarDeclarationList MethodDeclarationList '}' {
		cout << " \n";
    }

VarDeclarationList :
    /* empty */
    {
        cout << "empty var_list\n";
    }
    | VarDeclarationList VarDeclaration
    {
        cout << "var_list\n";
    }

VarDeclaration : Type Identifier ';'
{
    cout << "var declaration\n";
}

MethodDeclarationList :
    /* empty */
    {
        cout << "empty method_list\n";
    }
    | MethodDeclaration MethodDeclarationList    // WATAFUUUUUU
    {
        cout << "method_list\n";
    }

MethodDeclaration :
PUBLIC Type Identifier '(' ParameterList ')' '{' VarDeclarationList StatementList RETURN Expression ';' '}'
{
    cout << "Method declaration\n";
}

ParameterList:
    {
        cout << " \n";
    }
    | Type Identifier ParameterEnumerateList
    {
        cout << " \n";
    }

ParameterEnumerateList:
    {
        cout << " \n";
    }
    | ParameterEnumerate ParameterEnumerateList
    {
        cout << " \n";
    }

ParameterEnumerate:
    ',' Type Identifier{
        cout << " \n";
    }

Type:
    INT '[' ']'
        {
            cout << " \n";
        }
    | BOOL
        {
            cout << " \n";
        }
    | INT
        {
            cout << " \n";
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
    | Statement StatementList
    {
        cout << "method_list\n";
    }


Statement:
   '{' StatementList '}'
        {
            cout << " \n";
        }
   | IF '(' Expression ')' Statement ELSE Statement
        {
            cout << " \n";
        }
   | WHILE '(' Expression ')' Statement
        {
            cout << " \n";
        }
   | PRINTLN '(' Expression ')' ';'
        {
            cout << " \n";
        }
   | Identifier '=' Expression ';'
        {
            cout << " \n";
        }
   | Identifier '[' Expression ']' '=' Expression ';'
        {
            cout << "YOLO!\n";
        }

Expression :
    Expression  '<' Expression
        {
            cout << " \n";
        }
    | Expression '+' Expression
        {
            cout << " \n";
        }
    | Expression '-' Expression
        {
            cout << " \n";
        }
    | Expression '*' Expression
        {
            cout << " \n";
        }
    | Expression '.' LENGTH
        {
            cout << " \n";
        }
    | Expression '.' Identifier '(' ExpressionList ')'
        {
            cout << " \n";
        }
    | INTEGER_VAL
        {
            cout << " \n";
        }
    | BOOLEAN_VAL
        {
            cout << " \n";
        }
    | Identifier
        {
            cout << " \n";
        }
    | THIS
        {
            cout << " \n";
        }
    | NEW INT '[' Expression ']'
        {
            cout << " \n";
        }
    | NEW Identifier '(' ')'
        {
            cout << " \n";
        }
    | '!' Expression
            {
                cout << " \n";
            }
    | '(' Expression ')'
        {
            cout << " \n";
        }

Identifier: ID
    {
        cout << "id";
    }

ExpressionList:
    {
        cout << " \n";
    }
| Expression ExpressionEnumerateList
    {
        cout << " \n";
    }

ExpressionEnumerateList:
    {
        cout << " \n";
    }
    | ExpressionEnumerate ExpressionEnumerateList
    {
        cout << " \n";
    }

ExpressionEnumerate:
    ',' Expression {
        cout << " \n";
    }

