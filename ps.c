#include "types.h"
#include "fs.h"
#include "user.h"
#include "stat.h"
#include "fcntl.h"
#include "param.h"
enum procstate { UNUSED, EMBRYO, SLEEPING, RUNNABLE, RUNNING, ZOMBIE };
#include "proc_info.h"

struct proc_info pinfo[NPROC];


int main(int argc, char* argv[])
{
	/* utilizes psCall system_call */
	int processCount = psCall(pinfo);
	printf(1, "PID\t\tPriority\t\tState\t\tr_time\t\tw_time\t\tn_run\t\tcur_q\t\tq0\tq1\tq2\tq3\tq4\n\n");  

	for(int i = 0; i < processCount; i++)
	{
		printf(1, "%d\t\t", pinfo[i].pid);
		printf(1, "%d\t\t", pinfo[i].priority);

		if(pinfo[i].state == SLEEPING)
			printf(1, "sleeping\t\t");
		else if(pinfo[i].state == EMBRYO)
			printf(1, "embryo\t\t  ");
		else if(pinfo[i].state == RUNNABLE)
			printf(1, "runnable\t\t");
		else if(pinfo[i].state == RUNNING)
			printf(1, "running\t\t ");
		else
			printf(1, "zombie\t\t  ");

		printf(1, "%d\t\t%d\t\t%d\t\t%d\t\t", pinfo[i].rtime, pinfo[i].wtime,
				pinfo[i].n_run,
				(pinfo[i].cur_q));

		for(int j=0;j<5;j++)
			printf(1, "%d\t", pinfo[i].num_ticks[j]);
		printf(1, "\n");
	}

	exit();
}
