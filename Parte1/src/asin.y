/*****************************************************************************/
/**  Ejemplo de BISON-I: S E M - 2          2019-2020 <jbenedi@dsic.upv.es> **/
/*****************************************************************************/
%{
#include <stdio.h>
#include <string.h>
#include "header.h"
%}

%token MAS_ MENOS_ POR_ DIV_
%token CTE_ 
%token TRUE_ FALSE_ IF_ ELSE_ FOR_ WHILE_ DO_ READ_ PRINT_ INT_ BOOL_
%token MAS_ MENOS_ POR_ DIV_
%token IGUAL_ MASIGUAL_ MENOSIGUAL_ PORIGUAL_ DIVIGUAL_
%token AND_ OR_
%token IGUALIGUAL_ DIFERENTE_ 
%token MAYORQUE_ MENORQUE_ MAYORIGUAL_ MENORIGUAL_
%token MOD_ MASMAS_ MENOSMENOS_
%token LLAVE1_ LLAVE2_ CORCHETE1_ CORCHETE2_ PARENTESIS1_ PARENTESIS2_
%token PUNTOCOMA_

%%

expMat : exp
       ;
exp    : exp MAS_   term
       | exp MENOS_ term
       | term         
       ;
term   : term POR_ fac
       | term DIV_ fac   
       | fac             
       ;
fac    : PARENTESIS1_ exp PARENTESIS2_ 
       | CTE_            
       ;
%%
/*****************************************************************************/
int verbosidad = FALSE;                  /* Flag si se desea una traza       */

/*****************************************************************************/
void yyerror(const char *msg)
/*  Tratamiento de errores.                                                  */
{ fprintf(stderr, "\nError en la linea %d: %s\n", yylineno, msg); }

/*****************************************************************************/
int main(int argc, char **argv) 
/* Gestiona la linea de comandos e invoca al analizador sintactico-semantico.*/
{ int i, n=1 ;

  for (i=1; i<argc; ++i)
    if (strcmp(argv[i], "-v")==0) { verbosidad = TRUE; n++; }
  if (argc == n+1)
    if ((yyin = fopen (argv[n], "r")) == NULL) {
      fprintf (stderr, "El fichero '%s' no es valido\n", argv[n]) ;     
      fprintf (stderr, "Uso: cmc [-v] fichero\n");
    } 
    else yyparse();
  else fprintf (stderr, "Uso: cmc [-v] fichero\n");

  return (0);
} 
/*****************************************************************************/
