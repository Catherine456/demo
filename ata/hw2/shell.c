#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <signal.h>
#include <sys/wait.h>
#include <termios.h>
#include <unistd.h>

#include "tokenizer.h"

/* Convenience macro to silence compiler warnings about unused function parameters. */
#define unused __attribute__((unused))
#define MaxPATH 50
#define BUFSIZE 1024
#define MaxArgs 20
#define MaxNum 1000

/* Whether the shell is connected to an actual terminal or not. */
bool shell_is_interactive;

/* File descriptor for the shell input */
int shell_terminal;

/* Terminal mode settings for the shell */
struct termios shell_tmodes;

/* Process group id for the shell */
pid_t shell_pgid;

int cmd_exit(struct tokens *tokens);
int cmd_help(struct tokens *tokens);
int cmd_pwd(struct tokens *tokens); /*declared function 'cmd_pwd' */
int cmd_cd(struct tokens *tokens); /*declared function 'cmd_cd' */

/* Built-in command functions take token array (see parse.h) and return int */
typedef int cmd_fun_t(struct tokens *tokens);

/* Built-in command struct and lookup table */
typedef struct fun_desc {
  cmd_fun_t *fun;
  char *cmd;
  char *doc;
} fun_desc_t;

fun_desc_t cmd_table[] = {
  {cmd_help, "?", "show this help menu"},
  {cmd_exit, "exit", "exit the command shell"},
  {cmd_pwd, "pwd", "prints the current working directory to standard output"},
  {cmd_cd, "cd", "changes the current working directory to another"},
};

/* Prints a helpful description for the given command */
int cmd_help(unused struct tokens *tokens) {
  for (unsigned int i = 0; i < sizeof(cmd_table) / sizeof(fun_desc_t); i++)
    printf("%s - %s\n", cmd_table[i].cmd, cmd_table[i].doc);
  return 1;
}

/* Exits this shell */
int cmd_exit(unused struct tokens *tokens) {
  exit(0);
}

/*Add a new built-in pwd that prints the current working directory to standard output.*/
int cmd_pwd(unused struct tokens *tokens){
  char path[MaxPATH];
  puts(getcwd(path,MaxPATH)); //System calls getcwd()
  return 1;
}

/* add a new built-in cd that takes one argument, a directory path, and changes the
current working directory to that directory.*/
int cmd_cd(struct tokens *tokens){
  if (tokens_get_token(tokens, 1) == NULL)
  {
    char *home;
    home = getenv("HOME");
    chdir(home);
  }else
  {
    if (chdir(tokens_get_token(tokens, 1)) == -1)//System calls chdir
    {
      printf("chdir failed: %s\n",strerror(errno));
      return 0;
    }
  }
  return 1;
} 
/*
int cmd_cd(struct tokens *tokens){
  char buf[BUFSIZE+1];
  memset(buf,0,BUFSIZE+1);
  if (tokens_get_token(tokens, 1)[0] !='/' && tokens_get_token(tokens, 1)[0] != '.')
  {
    //char *getcwd(char *buf, size_t size);
    if (getcwd(buf,BUFSIZE) == NULL)
    {
      fprintf(stderr, "%s:%d: getcwd failed: %s\n", __FILE__, __LINE__, strerror(errno));
      return -1;
    }
    strncat(buf,"/",BUFSIZE-strlen(buf)); //Appends n characters to the end of the string 'buf'
  }
  //char *strncat(char *dest, const char *src, size_t n);
  strncat(buf,tokens_get_token(tokens, 1),BUFSIZE-strlen(buf));
  
#if DEBUG
  fprintf(stdout, "%s\n",buf);

#endif 
  //int chdir(const char *path);
  if (chdir(buf) == -1)
  {
    fprintf(stderr, "%s:%d: chdir failed: %s\n", __FILE__, __LINE__, strerror(errno));
  }
  return 0;
}*/

/* Looks up the built-in command, if it exists. */
int lookup(char cmd[]) {
  for (unsigned int i = 0; i < sizeof(cmd_table) / sizeof(fun_desc_t); i++)
    if (cmd && (strcmp(cmd_table[i].cmd, cmd) == 0))
      return i;
  return -1;
}


/* execute programs when they are entered into the shell.*/
int execute(struct tokens *tokens){
  int pid,exitstatus;
  pid = fork();
  if (pid < 0 ) {//Creation process failed
    perror("fork failed");
    exit(1);
    return 0;
  }else if (pid == 0) { //The child processes execute the code
    char *arglist[MaxArgs+1];
    int i;
    for (i = 0; ; i++)
    {
      if (tokens_get_token(tokens, i) == NULL)
      {
        break;
      }
      arglist[i]=tokens_get_token(tokens, i);
    }
    arglist[i]=NULL;
    char *path = getenv("PATH"); //Gets the system variable PATH
    char *newpath[MaxNum];
    char *res = strtok(path,":");
    int k=0;
    while (res != NULL)
    {
      newpath[k++] = res;
  //    printf("********%s\n",res);
      res = strtok(NULL, ":"); //Divide by ':' 
    }
    int j = 0;
    char temp[100];
    strcpy(temp,arglist[0]);
    ///////////////////////////////////
    int m=0;
    char *sarg[100];
    char *cook;
    char *in="<";
    char *out=">";
    while (arglist[m] != NULL)
    {
      cook = arglist[m];
      if (strcmp(cook,in) == 0 || strcmp(cook,out) == 0)
      {
        break;
      }
      sarg[m] = cook;
      m++;
    }
    sarg[m] = NULL;
    char *inFile,*outFile;
    while (arglist[m] != NULL)
    {
      cook = arglist[m];
      if (strcmp(in,cook) == 0)
      {
        inFile = arglist[m+1];
    //    printf("inFile**********%s\n",inFile);
        freopen(inFile,"r",stdin);  //重定向读
        m++;
        continue;
      }else if (strcmp(out,cook) == 0)
      {
        outFile = arglist[m+1];
    //    printf("outFile*********%s\n",outFile);
        freopen(outFile,"w",stdout); //重定向写
        m++;
        break;
      }
      m++;
    }
    //////////////////////////////////////////
    
    while (execv(temp,sarg) == -1 && j < k)
    {
      strcpy(temp,newpath[j]);
      j++;
      strcat(temp,"/");
      strcat(temp,arglist[0]);
    }
    if (execv(temp,sarg) == -1)
    {
      perror("execv failed");
      exit(1);
      return 0;
    }
  }else {  //The parent process executes the code
  //  printf("parent process\n");
    while(wait(&exitstatus)!=pid);
  //  printf("child exited with status %d,%d\n",exitstatus>>8,exitstatus&0377);
  }
  return 1;
}

/* Intialization procedures for this shell */
void init_shell() {
  /* Our shell is connected to standard input. */
  shell_terminal = STDIN_FILENO;

  /* Check if we are running interactively */
  shell_is_interactive = isatty(shell_terminal);

  if (shell_is_interactive) {
    /* If the shell is not currently in the foreground, we must pause the shell until it becomes a
     * foreground process. We use SIGTTIN to pause the shell. When the shell gets moved to the
     * foreground, we'll receive a SIGCONT. */
    while (tcgetpgrp(shell_terminal) != (shell_pgid = getpgrp()))
      kill(-shell_pgid, SIGTTIN);

    /* Saves the shell's process id */
    shell_pgid = getpid();

    /* Take control of the terminal */
    tcsetpgrp(shell_terminal, shell_pgid);

    /* Save the current termios to a variable, so it can be restored later. */
    tcgetattr(shell_terminal, &shell_tmodes);
  }
}

int main(unused int argc, unused char *argv[]) {
  init_shell();

  static char line[4096];
  int line_num = 0;

  /* Please only print shell prompts when standard input is not a tty */
  if (shell_is_interactive)
    fprintf(stdout, "%d: ", line_num);

  while (fgets(line, 4096, stdin)) {
    /* Split our line into words. */
    struct tokens *tokens = tokenize(line);
    
    /* Find which built-in function to run. */
    int fundex = lookup(tokens_get_token(tokens, 0));

    if (fundex >= 0) {
      cmd_table[fundex].fun(tokens);
    } else {
      /* REPLACE this to run commands as programs. */
      if (execute(tokens) == 0)
      {
        fprintf(stdout, "This shell doesn't know how to run programs.\n");
      }
    }

  //  freopen("","w",stdout) //重定向写
  //  freopen("","r",stdin)  //重定向读

/*
    if (argc != 3)
    { 
      printf("usage: inputFile outputFile\n");
      return 1;
    }
    int inFd,outFd;
    //open file descriptor
    inFd = open(argv[1],O_RDONLY);
    if (inFd < 0 )
    {
      printf("inFd open error!\n%s\n",strerror(errno));
      return 1;
    }
    outFd = open(argv[2], O_CREAT | O_TRUNC | O_RDWR, S_IRWXU | S_IRGRP | S_IROTH);
    if (outFd < 0)
    {
      printf("outFd open error!\n%s\n", strerror(errno));
      return 1;
    }
    //change standard input and output
    if (dup2(inFd,STDIN_FILENO) < 0)
    {
      printf("inFd dup2 error!\n");
      return 1;
    }
    if (dup2(outFd,STDOUT_FILENO) < 0)
    {
      printf("outFd dup2 error!\n");
      return 1;
    }   */

    if (shell_is_interactive)
      /* Please only print shell prompts when standard input is not a tty */
      fprintf(stdout, "%d: ", ++line_num);

    /* Clean up memory */
    tokens_destroy(tokens);
  }

  return 0;
}
