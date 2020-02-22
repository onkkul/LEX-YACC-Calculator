%{
    #include <stdlib.h>
    #include <stdio.h>
    #include "calc.tab.h"
    void yyerror(char *);

    int lc=1;
%}


digit   ([0-9])
var   ([a-z]([a-z0-9]*))


%%


"main()"    { return(TOK_MAIN);}

"{"         { return(TOK_CURLY_BRACK_S);  }

"}"         { return(TOK_CURLY_BRACK_E);  }

"="         { return(TOK_ASSIGN);  }

"print"     {return(TOK_PRINTLN);}

"; "         {   printf("Lexical Error -\n");}

{var}+      {
                yylval = *yytext - 'a';
                return TOK_CHAR;
            }

{digit}+    {
                sscanf(yytext, "%d", &yylval);
                return TOK_NUM;
            }

";"         {   return(TOK_SEMICOLON);  }

"+"         {   return(TOK_ADD);    }

"-"         {   return(TOK_SUB);    }

"*"         {   return(TOK_MUL);    }

"/"         {   return(TOK_DIV);    }

"+="        {   return(TOK_SELFADD);}

"-="        {   return(TOK_SELFSUB);}

"*="        {   return(TOK_SELFMUL);}

"/="        {   return(TOK_SELFDIV);}

"("         { return(TOK_BRACK_S);  }

")"         { return(TOK_BRACK_E);  }

[ \n]       {  lc++;return *yytext; }

[ \t]       ;

[" "]       ;

.           {   printf("Lexical error: -'%c'\n", yytext[0]); }


%%


int yywrap(void)
{
    return 1;
}