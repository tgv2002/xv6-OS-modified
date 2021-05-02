#include "types.h"
#include "user.h"

void cpuBoundProcesses(int n){

	for(int i = 0; i < n; i++)
	{
		int pid = fork();

		if(pid == 0)
		{
			for(double z = 0; z < 1200000.0; z+= 0.01)
			{
				double x =  x + 3.14 * 89.64;   // requires CPU time
			}

			printf(1, "Process: %d Finished\n", i);
			exit(); 
		}
	}

	while(wait()!=-1);
}

void ioBoundProcesses(int n)
{
	for (int i = 0; i < n; i++)
	{
		int pid = fork();

		if(pid == 0)
		{
			for(int k = 0; k < 80*n; k++)
			{
				sleep(10);    // I/O
			}

			printf(1, "Process: %d Finished\n", i);
			exit(); 
		}
	}

	while(wait() != -1);
}

int main(int argc, char *argv[])
{
	if(argc != 3)
	{
		printf(1,"Two arguments <processes type> and  <Number of processes> are needed\n");
		exit();
	}

	int n = atoi(argv[2]);
	int type = atoi(argv[1]);

	if(type == 0)
		cpuBoundProcesses(n);
	else if(type == 1)
		ioBoundProcesses(n);
	else
	{
		printf(1, "Invalid type argument :(\n");
	}

	exit();
}
