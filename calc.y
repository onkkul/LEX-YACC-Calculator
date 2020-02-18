%{
    #include <stdio.h>
%}

%token TOK_SEMICOLON TOK_ADD TOK_SUB TOK_MUL TOK_DIV TOK_NUM TOK_PRINTLN TOK_ID TOK_BRACK_S TOK_BRACK_E TOK_SELFADD TOK_SELFMUL TOK_SELFDIV TOK_SELFSUB

%union  {   int int_val;
            //char char_val;
        }

//%union  {char char_val;}

%type <int_val> E TOK_NUM

//%type <char_val> E TOK_ID

%left TOK_ADD TOK_SUB

%left TOK_BRACK_E TOK_BRACK_S TOK_MUL TOK_DIV

%left TOK_SELFMUL TOK_SELFDIV TOK_SELFADD TOK_SELFSUB

%%

    stmts   :
            |   stmt stmts
;

    stmt    :   E TOK_SEMICOLON
            |   E TOK_SELFMUL E     {$1 *= $3;}
            |   E TOK_SELFDIV E     {$1 /= $3;}            
            |   E TOK_SELFADD E     {$1 += $3;}
            |   E TOK_SELFSUB E     {$1 -= $3;}
            |   E
            |   TOK_PRINTLN E TOK_SEMICOLON  {   fprintf(stdout, "the value is %d\n", $2);}

;

    E       :   TOK_BRACK_S E TOK_BRACK_E {$$ = ($2);}

            |   E TOK_MUL E     {$$ = $1 * $3;}

            |   E TOK_DIV E     {$$ = $1 / $3;}

            |   E TOK_ADD E     {$$ = $1 + $3;}

            |   E TOK_SUB E     {$$ = $1 - $3;}
            
            |   TOK_SUB E       {$$ = -$2;} 

            |   TOK_NUM         {$$ = $1;}
            
            |   {fprintf(stdout, "\nResult=%d\n", $$);}
            
            
//            |   TOK_ID          {$$ = $1;}
;


%%



int yyerror(char *s)
{
	printf("syntax error\n");
	return 0;
}

int main()
{
   yyparse();
   return 0;
}
