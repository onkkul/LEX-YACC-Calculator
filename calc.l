%{
	#include <stdio.h>
	#include "calc.tab.h"
%}


digit   ([0-9])


%%
"println"   {return(TOK_PRINTLN);}

{digit}+    {   sscanf(yytext, "%d", &yylval);
                    return TOK_NUM;
                }

";"	        {	return(TOK_SEMICOLON);	}

"+"	        {	return(TOK_ADD);	}
"-"	        {	return(TOK_SUB);	}
"*"	        {	return(TOK_MUL);	}
"/"	        {	return(TOK_DIV);	}
"+="        {   return(TOK_SELFADD); }
"-="        {   return(TOK_SELFSUB); }
"*="        {   return(TOK_SELFMUL); }
"/="        {   return(TOK_SELFDIV); }


"\n" 	    {                       }
"\t"        {                       }

.	        {   printf("Invalid character '%c', ignored\n",yytext[0]);}

%%


int yywrap()
{
return 1;
}
    
    
    
    

