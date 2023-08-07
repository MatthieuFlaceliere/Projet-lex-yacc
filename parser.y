%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
        #include <math.h>
        //Int
        typedef struct intType { 
                int valeur;
                char *name;
                struct intTab *suivant; 
                struct intTab *precedent; 
        } *intTab; 
        intTab createVarInt(char*, int, intTab);
        intTab listInt = NULL;
        int rechercheInt(char*, intTab);
        int getVarInt(char*, intTab);
        int setVarInt(char*, int, intTab);
        //Bool
        typedef struct boolType { 
                int valeur;
                char *name;
                struct boolTab *suivant; 
                struct boolTab *precedent; 
        } *boolTab; 
        boolTab createVarBool(char*, int, boolTab);
        boolTab listBool = NULL;
        int rechercheBool(char*, boolTab);
        int getVarBool(char*, boolTab);
        int setVarBool(char*, int, boolTab);
        //Float
        typedef struct floatType { 
                float valeur;
                char *name;
                struct floatTab *suivant; 
                struct floatTab *precedent; 
        } *floatTab; 
        floatTab createVarFloat(char*, float, floatTab);
        float rechercheFloat(char*, floatTab);
        float getVarFloat(char*, floatTab);
        float setVarFloat(char*, float, floatTab);
        floatTab listFloat = NULL;
%}
%union
{
        char *varName;
        float fval;
        int ival;
}
%token <varName> VARNAME
%token <ival> NUM
%token <fval> FLOAT

%token FININST FINLIGNE 
        SET PRINT        
        PARENTHESE_GAUCHE PARENTHESE_DROITE
        SIN COS
        FALSE TRUE
        IDINT IDFLOAT IDBOOL
        blancs
%left PLUS MOINS FOIS DIVISE  
%left OR AND XOR NOT
%type <ival> Instruction BoolType intType Calcul
%type <fval> floatType expression
%start Input


%% 
Input : 
        | Input Ligne ;
Ligne:
        FINLIGNE {}
	| Instruction FININST FINLIGNE {}
	| SET Calcul FININST FINLIGNE {}
;
Instruction:
        IDINT VARNAME intType{
                if(rechercheVarType($2) == 0){
                        listInt = createVarInt($2, $3,listInt);
                }else{
                        yyerrok;
                        printf("Nom de variable déjà utilisé\n");
                        yyclearin;
                }
                $$ = 1;
        }
        |IDBOOL VARNAME BoolType{
                if(rechercheVarType($2) == 0){
                        listBool = createVarBool($2, $3,listBool);
                }else{
                        yyerrok;
                        printf("Nom de variable déjà utilisé\n");
                        yyclearin;
                }
                $$ = 1;
        }
        |IDFLOAT VARNAME floatType{
                if(rechercheVarType($2) == 0){
                        listFloat = createVarFloat($2, $3,listFloat);
                }else{
                        yyerrok;
                        printf("Nom de variable déjà utilisé\n");
                        yyclearin;
                }
                $$ = 1;
        }
        |PRINT VARNAME{
                switch( rechercheVarType($2) )
                {
                case 1:{
                        printf("%s : %d\n",$2,getVarInt($2, listInt) );
                        break;
                }
                case 2:{
                        int valBool = getVarBool($2, listBool);
                        if(valBool == 1){
                                printf("%s : True\n", $2);
                        }else if(valBool == 0){
                                printf("%s : False\n", $2);
                        }else{
                                printf("%s : NA\n", $2);
                        }
                        break;
                }
                case 3:{
                        printf("%s : %.6f\n",$2, getVarFloat($2, listFloat));
                        break;
                }
                default :
                        printf("Variable non existante");
                        break;
                }
                
        }
Calcul: VARNAME PARENTHESE_GAUCHE expression PARENTHESE_DROITE{
                switch( rechercheVarType($1) ){
                case 1:{
                        setVarInt($1, $3, listInt);
                        break;
                }
                case 2:{
                        setVarBool($1, $3, listBool);
                        break;
                }
                case 3:{
                        setVarFloat($1, $3, listFloat);
                        break;
                }
                default :
                        printf("Variable non existante %s", $1);
                        break;
                }
        } 

expression: expression PLUS expression {$$ = $1 + $3;}
| expression MOINS expression {$$ = $1 - $3;}
| expression FOIS expression {$$ = $1 * $3;}
| expression DIVISE expression {$$ = $1 / $3;}
| expression OR expression {$$ = (int)$1 | (int)$3;}
| expression AND expression {$$ = (int)$1 & (int)$3;}
| expression XOR expression {$$ = (int)$1 ^ (int)$3;}
| NOT expression {$$ = (int)$2 ^ 1;}
| PARENTHESE_GAUCHE expression PARENTHESE_DROITE {$$ = $2;}
| NUM {$$ = (float)$1;}
| FLOAT {$$ = $1;}
| FALSE {$$ = 0;}
| TRUE {$$ = 1;}
| SIN PARENTHESE_GAUCHE expression PARENTHESE_DROITE {$$ = sin($3);}
| COS PARENTHESE_GAUCHE expression PARENTHESE_DROITE{$$ = cos($3);}
| VARNAME {         
        switch( rechercheVarType($1) ){
                case 1:{
                        $$ = (float)getVarInt($1, listInt);
                        break;
                }
                case 2:{
                        $$ = (float)getVarBool($1, listBool);
                        break;
                }
                case 3:{
                        $$ = (float)getVarFloat($1, listFloat);
                        break;
                }
                default :
                        printf("Variable non existante %s", $1);
                        break;
        }
}

intType:
        NUM {$$ = $1;}
        |{$$ = NULL;}
BoolType :
        FALSE {$$ = 0;}
        |TRUE {$$ = 1;}
        |{$$ = NULL;}
floatType:
        FLOAT {$$ = $1;}
        |{$$ = 0;}

;

%%

int rechercheVarType(char *name){
        if(rechercheInt(name,listInt) != 0){
                return 1;
        }
        if(rechercheBool(name,listBool) != 0){
                return 2;
        }
        if(rechercheFloat(name,listFloat) != 0){
                return 3;
        }
        return 0;
}

//Int
intTab createVarInt(char *name, int value, intTab listIntSuivante){ 
        intTab tempIntList;

        tempIntList = (intTab)malloc(sizeof(struct intType)); 
        tempIntList->valeur = value;
        tempIntList->name = name;
        tempIntList->suivant = NULL; 
        tempIntList->precedent = NULL;
        if(listIntSuivante != NULL){
                tempIntList->precedent = listIntSuivante;
                listIntSuivante->suivant = tempIntList;
        }
        listIntSuivante = tempIntList;
        return listIntSuivante;

}

int getVarInt(char *name, intTab start){
        while (start != NULL){
                if(strcmp(start->name, name) == 0){
                        return start->valeur;
                }
                start = start->precedent; 
        };    
}

int setVarInt(char *name,int value, intTab start){
        while (start != NULL){
                if(strcmp(start->name, name) == 0){
                        start->valeur = value;
                        return;
                }
                start = start->precedent; 
        };    
}

int rechercheInt(char *name, intTab start){
        while (start != NULL){
                if(strcmp(start->name, name) == 0){
                        return 1;
                }
                start = start->precedent; 
        };
        return 0;
}

//Bool
boolTab createVarBool(char *name, int value, boolTab listBoolSuivante){ 
        boolTab tempBoolList;

        tempBoolList = (boolTab)malloc(sizeof(struct boolType)); 
        tempBoolList->valeur = value;
        tempBoolList->name = name;
        tempBoolList->suivant = NULL; 
        tempBoolList->precedent = NULL;
        if(listBoolSuivante != NULL){
                tempBoolList->precedent = listBoolSuivante;
                listBoolSuivante->suivant = tempBoolList;
        }
        listBoolSuivante = tempBoolList;
        return listBoolSuivante;
}

int rechercheBool(char *name, boolTab start){
        while (start != NULL){
                if(strcmp(start->name, name) == 0){
                        return 1;
                }
                start = start->precedent; 
        };
        return 0;
}

int getVarBool(char *name, boolTab start){
        while (start != NULL){
                if(strcmp(start->name, name) == 0){
                        return start->valeur;
                }
                start = start->precedent; 
        };    
}

int setVarBool(char *name,int value, boolTab start){
        while (start != NULL){
                if(strcmp(start->name, name) == 0){
                        start->valeur = value;
                        return;
                }
                start = start->precedent; 
        };    
}

//Float
floatTab createVarFloat(char *name, float value, floatTab listFloatSuivante){ 
        floatTab tempFloatList;

        tempFloatList = (floatTab)malloc(sizeof(struct floatType)); 
        tempFloatList->valeur = value;
        tempFloatList->name = name;
        tempFloatList->suivant = NULL; 
        tempFloatList->precedent = NULL;
        if(listFloatSuivante != NULL){
                tempFloatList->precedent = listFloatSuivante;
                listFloatSuivante->suivant = tempFloatList;
        }
        listFloatSuivante = tempFloatList;
        return listFloatSuivante;
}

float rechercheFloat(char *name, floatTab start){
        while (start != NULL){
                if(strcmp(start->name, name) == 0){
                        return 1;
                }
                start = start->precedent; 
        };
        return 0;
}

float getVarFloat(char *name, floatTab start){
        while (start != NULL){
                if(strcmp(start->name, name) == 0){
                        return start->valeur;
                }
                start = start->precedent; 
        };    
}

float setVarFloat(char *name,float value, floatTab start){
        while (start != NULL){
                if(strcmp(start->name, name) == 0){
                        start->valeur = value;
                        return;
                }
                start = start->precedent; 
        };    
}

void yyerror(char *s)
{
        while (listInt != NULL){ 
                free(listInt);
                listInt = listInt->precedent; 
        }
        
	fprintf(stderr, "Erreur :  %s\n", s);
        exit(0);
}

int main(void) { 
        
	yyparse();
} 