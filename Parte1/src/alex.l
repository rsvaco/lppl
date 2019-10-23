/*****************************************************************************/
/**  Ejemplo de BISON-I: S E M - 2          2019-2020 <jbenedi@dsic.upv.es> **/
/*****************************************************************************/
%{
#include <stdio.h>
#include <string.h>
#include "header.h"
#include "asin.h"

#define  retornar(x) {if (verbosidad) ECHO; return(x);}
%}
/*-----------------------------------------------------------------------------
  Estas opciones evitan "warnings" innecesarios y permiten obtener el
  numero de linea actual en la variable global "yylineno".
-----------------------------------------------------------------------------*/
%option noinput       
%option nounput       
%option yylineno  

delimitador     [ \t\n]+
digito          [0-9]
letra           [a-zA-Z]
entero          {digito}+
comentario      \/\/.*"\n"
id              {letra}{{letra}|{digito}|_}*


%%
"true"          { retornar(TRUE_); }
"false"         { retornar(FALSE_); }
"if"            { retornar(IF_); }
"else"          { retornar(ELSE_); }
"for"           { retornar(FOR_); }
"while"         { retornar(WHILE_); }
"do"            { retornar(DO_); }
"read"          { retornar(READ_); }
"print"         { retornar(PRINT_); }
"int"           { retornar(INT_); }
"bool"          { retornar(BOOL_); }
"struct"	{ retornar(STRUCT_); }


"+"             { retornar (MAS_);   }
"-"             { retornar (MENOS_); }
"*"             { retornar (POR_);   }
"/"             { retornar (DIV_);   }
"="             { retornar(IGUAL_); }
"+="            { retornar(MASIGUAL_); }
"-="            { retornar(MENOSIGUAL_); }
"*="            { retornar(PORIGUAL_); }
"/="            { retornar(DIVIGUAL_); }
"&&"            { retornar(AND_); }
"||"            { retornar(OR_); }
"=="            { retornar(IGUALIGUAL_); }
"!="            { retornar(DIFERENTE_); }
">"             { retornar(MAYORQUE_); }
"<"             { retornar(MENORQUE_); }
">="            { retornar(MAYORIGUAL_); }
"<="            { retornar(MENORIGUAL_); }

"%"             { retornar(MOD_); }
"++"            { retornar(MASMAS_); }
"--"            { retornar(MENOSMENOS_); }
"{"             { retornar(LLAVE1_); }
"}"             { retornar(LLAVE2_); }
"["             { retornar(CORCHETE1_); }
"]"             { retornar(CORCHETE2_); }
"("             { retornar(PARENTESIS1_); }
")"             { retornar(PARENTESIS2_); }
";"             { retornar(PUNTOCOMA_); }
                
{entero}        { retornar (CTE_);   }
{id}            { retornar(ID_); }
{delimitador}   { if (verbosidad) ECHO; }
{comentario}    { if (verbosidad) ECHO; }
.               { yyerror("Caracter desconocido"); }
%%
"/="            { retornar(DIVIGUAL_); }
"&&"            { retornar(AND_); }
"||"            { retornar(OR_); }
"=="            { retornar(IGUALIGUAL_); }
"!="            { retornar(DIFERENTE_); }
">"             { retornar(MAYORQUE_); }
"<"             { retornar(MENORQUE_); }
">="            { retornar(MAYORIGUAL_); }
"<="            { retornar(MENORIGUAL_); }

"%"             { retornar(MOD_); }
"++"            { retornar(MASMAS_); }
"--"            { retornar(MENOSMENOS_); }
"{"             { retornar(LLAVE1_); }
"}"             { retornar(LLAVE2_); }
"["             { retornar(CORCHETE1_); }
"]"             { retornar(CORCHETE2_); }
"("             { retornar(PARENTESIS1_); }
")"             { retornar(PARENTESIS2_); }
";"             { retornar(PUNTOCOMA_); }
                
{entero}        { retornar (CTE_);   }
{id}            { retornar(ID_); }
{delimitador}   { if (verbosidad) ECHO; }
{comentario}    { if (verbosidad) ECHO; }
.               { yyerror("Caracter desconocido"); }
%%
"*="            { retornar(PORIGUAL_); }
"/="            { retornar(DIVIGUAL_); }
"&&"            { retornar(AND_); }
"||"            { retornar(OR_); }
"=="            { retornar(IGUALIGUAL_); }
"!="            { retornar(DIFERENTE_); }
">"             { retornar(MAYORQUE_); }
"<"             { retornar(MENORQUE_); }
">="            { retornar(MAYORIGUAL_); }
"<="            { retornar(MENORIGUAL_); }
"+"             { retornar(MAS_); }
"-"             { retornar(MENOS_); }
"*"             { retornar(POR_); }
"/"             { retornar(DIV_); }
"%"             { retornar(MOD_); }
"++"            { retornar(MASMAS_); }
"--"            { retornar(MENOSMENOS_); }
"{"             { retornar(LLAVE1_); }
"}"             { retornar(LLAVE2_); }
"["             { retornar(CORCHETE1_); }
"]"             { retornar(CORCHETE2_); }
"("             { retornar(PARENTESIS1_); }
")"             { retornar(PARENTESIS2_); }
";"             { retornar(PUNTOCOMA_); }
                
{entero}       { retornar (CTE_);   }
{id}           { retornar(ID_); }
{comentario}   {  }
.              { yyerror("Caracter desconocido"); }
%%
