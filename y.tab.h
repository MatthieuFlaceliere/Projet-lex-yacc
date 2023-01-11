/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     VARNAME = 258,
     NUM = 259,
     FLOAT = 260,
     FININST = 261,
     FINLIGNE = 262,
     SET = 263,
     PRINT = 264,
     PARENTHESE_GAUCHE = 265,
     PARENTHESE_DROITE = 266,
     SIN = 267,
     COS = 268,
     FALSE = 269,
     TRUE = 270,
     IDINT = 271,
     IDFLOAT = 272,
     IDBOOL = 273,
     blancs = 274,
     DIVISE = 275,
     FOIS = 276,
     MOINS = 277,
     PLUS = 278,
     NOT = 279,
     XOR = 280,
     AND = 281,
     OR = 282
   };
#endif
/* Tokens.  */
#define VARNAME 258
#define NUM 259
#define FLOAT 260
#define FININST 261
#define FINLIGNE 262
#define SET 263
#define PRINT 264
#define PARENTHESE_GAUCHE 265
#define PARENTHESE_DROITE 266
#define SIN 267
#define COS 268
#define FALSE 269
#define TRUE 270
#define IDINT 271
#define IDFLOAT 272
#define IDBOOL 273
#define blancs 274
#define DIVISE 275
#define FOIS 276
#define MOINS 277
#define PLUS 278
#define NOT 279
#define XOR 280
#define AND 281
#define OR 282



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 2058 of yacc.c  */
#line 44 ".\\projet_yacc_Flaceliere.y"

        char *varName;
        float fval;
        int ival;


/* Line 2058 of yacc.c  */
#line 118 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
