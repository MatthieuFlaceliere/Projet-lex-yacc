%option noyywrap
%{
    #include<stdlib.h>
	#include<stdio.h>
    #include "y.tab.h"
%}
blancs  [ \t]+
let [a-zA-Z]
chif [0-9]

idInt [Ii][nN][tT]
idFloat [Ff][Ll][Oo][Aa][Tt]
idBool [Bb][Oo][Oo][Ll]

False    [Ff][Aa][Ll][Ss][Ee]
True    [Tt][Rr][Uu][Ee]

varName {let}(_|$|{let}|{chif})*
%%
";" {return FININST;}
"\n" {return FINLIGNE;}
"#".* {/*Commentaire sur une ligne*/}
"/#"  { /* début d'un commentaire multiligne */
    int c;
    while((c = input()) != EOF) {
        if(c == '#') {
            if((c = input()) == '/') {
                break; /* fin du commentaire multiligne */
            }
            else {
                unput(c);
            }
        }
    }
}

"Set" {return SET;}
"Print" {return PRINT;}

"OR" {return OR;}
"AND" {return AND;}
"XOR" {return XOR;}
"NOT" {return NOT;}

"+"   {return PLUS;}
"-"   {return MOINS;}
"*"   {return FOIS;}
"/"   {return DIVISE;}

"("   {return PARENTHESE_GAUCHE;}
")"   {return PARENTHESE_DROITE;}

"SIN" {return SIN;}
"COS" {return COS;}

{blancs}  { /* On ignore */ }

{idInt}   {return IDINT;}
{idFloat}   {return IDFLOAT;}
{idBool}   {return IDBOOL;}

[0-9]+ {
	yylval.ival=atoi(yytext);
	return NUM;
}

[0-9]+\.[0-9]+ {
	yylval.fval=atof(yytext);
	return FLOAT;
}

{False}   {return FALSE;}
{True}   {return TRUE;}

{varName} {
	yylval.varName = strdup(yytext);
	return VARNAME;
}
.   {yyerror("Entree non reconnue");}
%%