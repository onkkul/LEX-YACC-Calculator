# LEX-YACC-Calculator
A simple calculator using LEX (Lexical Analyzer) and YACC (Yet Another Compiler Compiler)

***Operations Supported:***
- Basic Math
- Logrithms
- Exonentials
- "+=" operators i.e. a += 3
- Trignometry


***Run Sequence:***
- flex -l calc.l
- bison -dv calc.y
- gcc -o calc calc.tab.c lex.yy.c
 - ./calc
 
 Or just run the makefile...!!
