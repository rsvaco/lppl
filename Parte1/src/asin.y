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
%token PUNTOCOMA_ STRUCT_

%%

programa            
    : LLAVE1 secuenciaSentencias LLAVE2
                    ;

secuenciaSentencias 
    : sentencia
    | secuenciaSentencias sentencia
    ;

sentencia           
    : declaracion
    | instruccion
    ;

declaracion         
    : tipoSimple ID_ PUNTOCOMA_
    | tipoSimple ID_ IGUAL_ CTE_ PUNTOCOMA_
    | tipoSimple ID_ CORCHETE1_ CTE_ CORCHETE2_ PUNTOCOMA_
    | STRUCT_ LLAVE1_ listaCampos LLAVE2_ ID_ PUNTOCOMA_
    ;

tipoSimple          : INT_
                    | BOOL_
                    ;

listaCampos         : tipoSimple ID_ PUNTOCOMA_
                    | listaCampos tipoSimple ID_ PUNTOCOMA_
                    ;

instruccion         : LLAVE1_ LLAVE2_
                    | LLAVE1_ listaInstrucciones LLAVE2_
                    | instruccionEntradaSalida
                    | instruccionSeleccion
                    | instruccionIteracion
                    | instruccionExpresion
                    ;

listaInstrucciones  : instruccion
                    | listaInstrucciones instruccion
                    ;

instruccionEntradaSalida    : READ_ PARENTESIS1_ ID_ PARENTESIS2_ PUNTOCOMA_
                            | PRINT_ PARENTESIS1_ expresion PARENTESIS2_ PUNTOCOMA_
                            ;

instruccionSeleccion    : IF_ PARENTESIS1_ expresion PARENTESIS2_ instruccion ELSE_ instruccion
                        ;

instruccionIteracion    : WHILE_ PARENTESIS1_ expresion PARENTESIS2_ instruccion
                        ;

instruccionExpresion    : expresion PUNTOCOMA_
                        | PUNTOCOMA_
                        ;

expresion           : expresionLogica
                    | ID_ operadorAsignacion expresion
                    | ID_ CORCHETE1_ expresion CORCHETE2_ operadorAsignacion expresion
                    | ID_ 


/**************

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

**********/


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
