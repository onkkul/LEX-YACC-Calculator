# LEX-YACC-Calculator
A simple calculator using LEX (Lexical Analyzer) and YACC (Yet Another Compiler Compiler)

***Run Sequence:***
- flex -l calc.l
- bison -dv calc.y
- gcc -o calc calc.tab.c lex.yy.c
 - ./calc
