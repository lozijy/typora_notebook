code01

```c
#include<stdio.h>
#include<malloc.h>
#include<string.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#define spliped " \t\n\r"
#define mysh_bufsize 64
size_t BufSize=64;
char *cmd[]={
    "cd",
    "help",
    "exit"
};
char *readline(){
    size_t BufSize;
    char * line =NULL;
    getline(&line,&BufSize,stdin);
    return line;
}
char **split(char*line){
    char **split=(char**)malloc(mysh_bufsize*sizeof(char*));
    int position=0;
    char *token=strtok(line,spliped);
    while(token!=NULL){
        split[position++]=token;
        token=strtok(NULL,spliped);
    }
    return split;
}
int execute(char**args){
    int status=1;
    return status;
}
void loop(){

    char *line=NULL;
    char **args=NULL;
    int status=1;
    do
    {   
        char path[100];
        getcwd(path,100);
        char now[200]="[mysh";
        strcat(now,path);
        strcat(now,"]$");
        printf("%s",now);
        line=readline();
        args=split(line);

        free(line);
        free(args);
    } while (status);
    
}

int main(){
    loop();
    return 1;
}

```

code02

```c
#include<stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#define MYSH_TOK_DELIM " \t\n\r"
#define MYSH_TOK_BUFFER_SIZE 64
#define _XOPEN_SOURCE 600
int mysh_builtin_nums();
int mysh_help(char **);
int mysh_cd(char **args);
int mysh_exit(char **args);
int mysh_builtin_nums();
char* mysh_read_line();
char** mysh_split_line(char*line);
int mysh_launch(char **args);
int mysh_execute(char **args);
void mysh_loop();

char *builtin_cmd[]={
        "cd",
        "help",
        "&exit"
};
int (*buildin_func[])(char **)={//函数指针数组
        &mysh_cd,
        &mysh_help,
        &mysh_exit
};


int mysh_cd(char **args){
    if(args[1]==NULL){
        perror("Mysh error at cd,lack of args\n");
    }
    else{
        if(chdir(args[1])!=0){
            perror("Mysh error at chdir\n");
        }
    }
    return 1;
}
int mysh_help(char **args){
    puts("This is Mt's shell");
    puts("Here are some built in cmd:");
    for(int i=0;i<mysh_builtin_nums();i++){
        printf("%s",builtin_cmd[i]);
    }
    return 1;
}
int mysh_exit(char **args){
    return 0;
}

int mysh_builtin_nums(){
    return sizeof(builtin_cmd)/sizeof (builtin_cmd[0]);
}

char* mysh_read_line(){
    char *line=NULL;
    size_t bufsize;
    getline(&line,&bufsize,stdin);
    return line;
}
char** mysh_split_line(char*line){
    int buffer_size=MYSH_TOK_BUFFER_SIZE,position=0;
    char**tokens= (char**)malloc(buffer_size*sizeof (char*));
    char *token;
    token=strtok(line,MYSH_TOK_DELIM);//分词
    while(token!=NULL){
        tokens[position++]=token;
        token=strtok(NULL,MYSH_TOK_DELIM);
    }
    tokens[position]=NULL;
    return tokens;
}
int mysh_launch(char **args){
    pid_t pid,wpid;
    int status;
    pid=fork();
    if(pid==0){
        if(execvp(args[0],args)==-1){
            perror("Mysh error at execvp");
        }
        exit(EXIT_FAILURE);
    }
    else{
        do{
            wpid=waitpid(pid,&status,WUNTRACED);
        }while(!WIFEXITED(status)&&!WIFSIGNALED(status));
    }
    return 1;
}
int mysh_execute(char **args){
    if(args[0]==NULL)return 1;
    for(int i=0;i<mysh_builtin_nums();i++){
        if(strcmp(args[0],builtin_cmd[i])==0){
            return(*buildin_func[i])(args);
        }
    }
    return mysh_launch(args);

}
void mysh_loop(){
    char *line;
    char**args;
    int status;
    do{
        char path[100];
        getcwd(path,100);
        char now[200]="[mysh";
        strcat(now,path);
        strcat(now,"]$");
        printf("%s",now);
        line=mysh_read_line();
        args=mysh_split_line(line);
        status=mysh_execute(args);

        free(line);
        free(args);
    } while (status);
}

int main(){
    mysh_loop();
    return 0;

};

```

