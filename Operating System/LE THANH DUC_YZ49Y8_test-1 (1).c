#include <stdio.h>
#include<stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <signal.h>
#include <sys/types.h>
#include<sys/wait.h>
#include<unistd.h>
#include <time.h>
#include <sys/msg.h>
#include <sys/ipc.h>
#include <sys/shm.h>
struct message {
    long mtype;
    char mtext[8192];
};
void sig_action_function(int sig, siginfo_t *info, void *ptr)
{
  union sigval value = info->si_value;
  printf("\n%s\n",(char*) value.sival_ptr);
}
int main()
{
  /* create message queue */
  int msqid = msgget(IPC_PRIVATE, IPC_CREAT | 0600);
  if (msqid == -1) {
      perror("msgget");
      return EXIT_FAILURE;
  }
  //SIGNAL implement
  struct sigaction act;
  union sigval value;
  memset (&act, '\0', sizeof(act));
  act.sa_sigaction = sig_action_function;
  act.sa_flags = SA_SIGINFO;

  sigaction(SIGALRM, &act, 0);
  //END SIGNAL implement
  int pipe1[2],pipe2[2];
  if (pipe(pipe1)==-1)
  {
      fprintf(stderr, "Pipe Failed" );
      return 1;
  }
  if (pipe(pipe2)==-1)
  {
      fprintf(stderr, "Pipe Failed" );
      return 1;
  }
  pid_t child1, child2;
  child1  = fork();
if (child1 == 0)  // 1st child code
{
  value.sival_ptr = "\nPolice Lieutenant is Ready!\n";
  printf("\nPolice Lieutenant sending signal ....\n");
  sigqueue(getppid(), SIGALRM, value);
  wait(NULL);
  char mess[100]={0},ans[100]={0};
  read(pipe1[0], mess, 100);
  printf("\nPolice Lieutenant received mess through pipe: \n");
  puts(mess);
  close(pipe1[0]);
  fflush(stdin);
  printf("\nSending answer through pipe to Commander\n");
  strcat(ans,"Yes , it is compulsory to wear the mask when you leave your flat!");
  write(pipe2[1], ans, strlen(ans)+1);
  close(pipe2[1]);
  exit(0);
} else if (child1 > 0)
	{
    child2 = fork();
  	if (child2 == 0)
		  { // 2nd child code
        value.sival_ptr = "\nNational Head Physician is Ready!\n";
        printf("\nNational Head Physician sending signal ....\n");
        sigqueue(getppid(), SIGALRM, value);
        struct message message;
        message.mtype = 23;
        memset(&(message.mtext), 0, 8192 * sizeof(char));
        (void)strcpy(message.mtext, "To wear a mask is really very important to save other people and ourself  against the virus in the shops and on the roads");
        if (msgsnd(msqid, &message, sizeof(long) + (strlen(message.mtext) * sizeof(char)) + 1, 0) == -1) {
            perror("msgsnd");
            return EXIT_FAILURE;
        }

        //Uncomment this for answer of question 3
    // key_t key = ftok("shmfile",65);
    // int shmid = shmget(key,1024,0666|IPC_CREAT);
    // char *str = (char*) shmat(shmid,(void*)0,0);
    // printf("\nEnter Number : ");
    // gets(str);
    // printf("Data written in memory: %s\n",str);
    // shmdt(str);
    exit(0);
      } else
				{  //PARENT CODE
          char mess[100]={0},ans[100]={0};
          wait(NULL); // wait for signal
          printf("\nCommander sending question to Lieutenant..\n");
          strcat(mess,"Is it compulsory to wear a mask in the shops?");
          write(pipe1[1], mess, strlen(mess)+1);
          close(pipe1[1]);
          read(pipe2[0], ans, 100);
          printf("\nPolice Lieutenant answered:\n");
          puts(ans);
          close(pipe2[0]);
          printf("\n-------------------End of question 1---------------------\n");
          wait(NULL);
          printf("\n\nReceived message through messagequeue from National Health:\n");
          struct message message;
          if (msgrcv(msqid, &message, 8192, 0, 0) == -1) {
              perror("msgrcv");
              return EXIT_FAILURE;
          }
          printf("%s\n", message.mtext);
          /* destroy message queue */
          if (msgctl(msqid, IPC_RMID, NULL) == -1) {
              perror("msgctl");

              return EXIT_FAILURE;
          }

          printf("\n-------------------End of question 2---------------------\n");

          //Uncomment this for the task 3
          //I could not check because the opsys server is down during this task

          // key_t key = ftok("shmfile",65);
          // int shmid = shmget(key,1024,0666|IPC_CREAT);
          // char *str = (char*) shmat(shmid,(void*)0,0);
          // printf("Data read from memory: %s\n",str);
          // shmdt(str);
          // shmctl(shmid,IPC_RMID,NULL);

          printf("\n-------------------End of question 3---------------------\n")
          printf("\nEverything finished!\n");
					exit(0);


				}
	} else if (child1<0){
		fprintf(stderr, "fork Failed" );
  }
  return 0;
}
