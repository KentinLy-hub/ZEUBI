#include "42sh.h"
#include <signal.h>
#include <getopt.h>

struct global global = {0, 0, 0, 1, 0, 0, 0, NULL};

void sig_handler(int signo)
{
    if (signo == SIGINT)
        printf("received SIGINT\n");
}

void options_management(struct tree *ast, int argc, char **argv)
{
    for (int i = 0; i < argc; i++)
    {
        if (strcmp(argv[i], "--ast-print") == 0)
            printTree(ast);
    }
}

void history(char *s)
{
    FILE *f = fopen(".42sh_history", "a");
    if (!f)
    {
        fprintf(stderr, "error while opening .42sh_history\n");

        return;
    }

    fwrite(s, sizeof(char), strlen(s), f);
    fclose(f);

    return;
}

void call_lexer_stdin(void)
{
    while (1)
    {
        struct list *lexedInput = list_init();
        char *input = xmalloc(MAGIC_NB, sizeof(char));

        printf("42sh$ ");
        fgets(input, MAGIC_NB, stdin);
        history(input);

        if (strcmp(input, "exit\n") == 0)
        {
            free(input);
            destroy_list(lexedInput);
            return;
        }
        if (input[0] == '\0')
        {
            puts("");
            free(input);
            destroy_list(lexedInput);
            return;
        }

        lexer(input, lexedInput);
        struct tree *ast = parser(lexedInput);
        struct var *mesVars = init_var();
        execute_ast(ast, mesVars);
        delete_all_nodes(ast);

        free(input);
        destroy_list(lexedInput);
        dellete_all_vars(mesVars);
    }

    return;
}

void call_lexer_pipe(int argc, char **argv)
{
    struct list *lexedInput = list_init();
    char *input = xmalloc(MAGIC_NB, sizeof(char));
    while (1)
    {
        char *localInput = xmalloc(MAGIC_NB, sizeof(char));
        fgets(localInput, MAGIC_NB, stdin);
        strcat(input, localInput);
        if (strcmp(localInput, "exit\n") == 0 || strcmp(localInput, "\0") == 0)
        {
            free(localInput);
            break;
        }
        free(localInput);
    }
    lexer(input, lexedInput);
    struct tree *ast = parser(lexedInput);
    options_management(ast, argc, argv);
    struct var *mesVars = init_var();
    add_start_variable(mesVars, argc, argv);
    execute_ast(ast, mesVars);

    free(input);
    destroy_list(lexedInput);
    delete_all_nodes(ast);
    dellete_all_vars(mesVars);
}

void call_lexer_for_file(char *path, int argc, char **argv)
{
    int j = 0;
    int c = 0;
    struct list *lexedInput = list_init();
    int a = MAGIC_NB;
    FILE *fd = fopen(path, "r+");
    if (fd == NULL)
        err(127, "%s", path);
    char *input = xmalloc(sizeof(char), MAGIC_NB);

    while ((c = getc(fd)) != EOF)
    {
        input[j++] = c;
        if (j > a - 2)
        {
            a += MAGIC_NB;
            input = realloc(input, a);
        }
    }

    lexer(input, lexedInput);
    struct tree *ast = parser(lexedInput);
    options_management(ast, argc, argv);
    struct var *mesVars = init_var();
    add_start_variable(mesVars, argc, argv);
    execute_ast(ast, mesVars);

    fclose(fd);
    free(input);
    destroy_list(lexedInput);
    delete_all_nodes(ast);
    dellete_all_vars(mesVars);
    return;
}

void call_lexer_for_c(char **s, int argc)
{
    char *input = s[2];
    if (strcmp(input, "--ast-print") == 0)
    {
        if (argc == 3)
        {
            fprintf(stderr, "42sh: -c: requires an argument\n");
            global.error = 2;

            return;
        }

        input = s[3];
    }

    struct list *lexedInput = list_init();
    lexer(input, lexedInput);
    struct tree *ast = parser(lexedInput);
    options_management(ast, argc, s);
    struct var *mesVars = init_var();
    add_start_variable(mesVars, argc, s);
    execute_ast(ast, mesVars);

    destroy_list(lexedInput);
    delete_all_nodes(ast);
    dellete_all_vars(mesVars);

    return;
}

int main(int argc, char **argv)
{
    if (argc > 1)
    {
        if (strcmp(argv[1], "-c") == 0)
        {
            if (argc == 2)
            {
                fprintf(stderr, "42sh: -c: requires an argument\n");

                return 2;
            }

            call_lexer_for_c(argv, argc);

            return global.error;
        }
    }

    int a = isatty(fileno(stdin));
    if (a >= 1)
    {

        if (argc == 1)
            call_lexer_stdin();
        if (argc >= 2)
            call_lexer_for_file(argv[1], argc, argv);
    }
    else
        call_lexer_pipe(argc, argv);

    return global.error;
}
