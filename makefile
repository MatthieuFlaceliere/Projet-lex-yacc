EXECUTABLE = calc

# Spécifiez les fichiers sources
LEX_FILE = lexer.l
YACC_FILE = parser.y
C_FILES = lex.yy.c y.tab.c

# Commandes de compilation
CC = gcc
LEX = flex
YACC = yacc


all: $(EXECUTABLE)

$(EXECUTABLE): $(C_FILES)
	$(CC) -Wall -o $(EXECUTABLE) $(C_FILES) -lm

lex.yy.c: $(LEX_FILE)
	$(LEX) $(LEX_FILE)

y.tab.c: $(YACC_FILE)
	$(YACC) -d $(YACC_FILE)

clean:
	rm -f $(EXECUTABLE) lex.yy.c y.tab.c y.tab.h

.PHONY: clean
