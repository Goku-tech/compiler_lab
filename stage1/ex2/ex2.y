%{
	#include <stdlib.h>
	#include <stdio.h>
	#include "exprtree.h"
	#include "exprtree.c"

    extern FILE* yyin;

	int yylex(void);
%}

%union{
	struct tnode *no;
	
}
%type <no> expr NUM program END
%token NUM PLUS MINUS MUL DIV END
%left PLUS MINUS
%left MUL DIV

%%

program : expr END	{
				$$ = $2;
                FILE *fptr=fopen("ex2.xsm","w");
				fprintf(fptr, "%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n",0,2056,0,0,0,0,0,0);
               
                int resreg_no=codeGen($1,fptr);
                callwrite(fptr,resreg_no);
                
                fprintf(fptr,"INT 10");
				
				exit(1);
			}
		;

expr : PLUS expr expr		{$$ = makeOperatorNode('+',$2,$3);}
	 | MINUS expr expr  	{$$ = makeOperatorNode('-',$2,$3);}
	 | MUL expr expr	{$$ = makeOperatorNode('*',$2,$3);}
	 | DIV expr expr	{$$ = makeOperatorNode('/',$2,$3);}
	 | '(' expr ')'		{$$ = $2;}
	 | NUM			{$$ = $1;}
	 ;

%%

yyerror(char const *s)
{
    printf("yyerror %s",s);
}


int main(void) 
{
    yyin=fopen("ex2.txt","r");
	yyparse();
	
	return 0;
}