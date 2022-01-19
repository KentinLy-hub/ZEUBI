C_FILES=src/42sh.c src/lexer/lexer.c src/tools/ast.c src/builtins/echo.c \
    src/parser/parser.c src/parser/grammaire.c src/execution/execute.c \
    src/tools/ast_print.c src/tools/tests.c src/tools/variables.c \
    src/tools/string_f.c
TESTS=tests testsuite_python
HEADERS=src/42sh.h src/lexer/lexer.h src/tools/ast.h src/builtins/echo.h \
    src/parser/parser.h src/parser/grammaire.h src/execution/execute.h \
    src/tools/ast_print.h src/tools/tests.h src/tools/variables.h \
    src/tools/string_f.c
OTHER_FILES=doc ProjectMakefile Makefile.am configure.ac

comg:
	gcc -g -Werror -Wextra -Wall -pedantic -std=c99 \
                           -D_XOPEN_SOURCE=1 ${C_FILES} -o 42sh

add:
	git add $(C_FILES) $(PROJECT) $(TESTS) $(HEADERS) $(OTHER_FILES)
	git commit
	git push

dot:
	dot tree.dot -Tpng -o tree.png



.PHONY: comg add dot
