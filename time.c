#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char* argv[])
{
    /* utilizes waitx system call */ 
	
    if(argc == 1)
    {
        printf(1,"Insufficient arguments :(\n");
        exit();
    }

    // creating another process
    int pid = fork();

    if(pid < 0)
    {
        printf(1, "Fork failed :(\n");
        exit();
    }

    else if(pid == 0)
    {
        //Execute given program in child
        exec(argv[1],argv + 1);
    }

    else
    {
        //in parent
        int wtime,rtime, retVal;
        retVal = waitx(&wtime, &rtime);
        printf(1,"Waiting time is %d and Run time is %d\n",wtime,rtime);
        printf(1, "Waitx returned %d\n", retVal);
    }

    exit();
    
}
