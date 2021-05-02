#include "types.h"
#include "user.h"
#include "stat.h"

int main(int argc, char* argv[])
{
    /* utilizes set_priority system call */
    
    if(argc != 3)
    {
        printf(1, "Invalid number of arguments :(\n");
        exit();
    }

    /* If negative numbers are entered, they are treated as zeroes */
    
    int new_priority = atoi(argv[1]);
    int pid = atoi(argv[2]);
    int prevPriority = set_priority(new_priority, pid);

    if(prevPriority != -1)
    {   
        printf(1,"Previous priority of process with pid %d was %d\n", pid, prevPriority);
        printf(1,"New priority of process with pid %d is %d\n", pid, new_priority);
    }

    else
    {
        printf(1, "Priority %d could not be assigned to process with pid %d :(\n", new_priority, pid);
    }
    
    exit();
}