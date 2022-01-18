EXTRA_DIST = autogen.sh
ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
AM_MAKEFLAGS = --no-print-directory

AM_CPPFLAGS = \
	      -include $(top_builddir)/config.h \
	      -I${top_srcdir}/src

AM_CFLAGS = -Wall -Wextra -Werror -pedantic -std=c99 -g
AM_LDFLAGS = $(WARN_LDFLAGS)

bin_PROGRAMS = 42sh

42sh_SOURCES = \
		  src/42sh.c \
		  src/42sh.h \
		  src/tools/ast.c \
		  src/tools/ast.h \
		  src/builtins/echo.c \
		  src/builtins/echo.h \
		  src/lexer/lexer.c \
		  src/lexer/lexer.h \
		  src/parser/grammaire.c \
		  src/parser/grammaire.h \
		  src/parser/parser.c \
		  src/parser/parser.h \
		  src/execution/execute.c \
		  src/tools/variables.c \
		  src/tools/variables.h \
		  src/execution/execute.h \
		  src/tools/ast_print.c \
		  src/tools/ast_print.h \
		  src/tools/string_f.c \
		  src/tools/string_f.h \
		  src/tools/tests.c \
		  src/tools/tests.h

42sh_LDADD = $(PTHREAD_LIBS) $(OPENSSL_LDFLAGS) $(OPENSSL_LIBS) $(CURL_LIBS)

