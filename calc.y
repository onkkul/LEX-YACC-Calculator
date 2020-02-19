%{
    #include <stdlib.h>
    #include <stdio.h>
    void yyerror(char *);
    int yylex(void);
    int sym[26];
%}


%token TOK_NUM TOK_CHAR
%token TOK_ADD TOK_SUB TOK_MUL TOK_DIV 
%token TOK_SELFADD TOK_SELFSUB TOK_SELFMUL TOK_SELFDIV 

%left TOK_ADD TOK_SUB
%left TOK_MUL TOK_DIV
%left TOK_SELFADD TOK_SELFSUB TOK_SELFMUL TOK_SELFDIV 


%%

stmts   :   stmts stmt '\n'
        | 
;

//add print statement here
stmt    :   E                   { printf("The value is: %d\n", $1); }
        |   TOK_CHAR '=' E      { sym[$1] = $3; }
;

E       :   TOK_NUM
        |   TOK_CHAR            { $$ = sym[$1]; }
        |   E TOK_ADD E         { $$ = $1 + $3; }
        |   E TOK_SUB E         { $$ = $1 - $3; }
        |   E TOK_MUL E         { $$ = $1 * $3; }
        |   E TOK_DIV E         { $$ = $1 / $3; }
        
        // work on this whole SELF segment
        |   E TOK_SELFADD E     { $$ = $1 = ($1 + $3);}
        |   E TOK_SELFSUB E     { $$ = $1 = ($1 - $3);}
        |   E TOK_SELFMUL E     { $$ = $1 = ($1 * $3);}
        |   E TOK_SELFDIV E     { $$ = $1 = ($1 / $3);}

        
        |   '(' E ')'           { $$ = $2; }
        
        |   TOK_SUB E   {$$ = 0-$2;} 

;

%%

void yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
}

int main(void)
{
    yyparse();
    return 0;
}