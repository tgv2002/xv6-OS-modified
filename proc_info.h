#ifndef __PROC_INFO_H
#define __PROC_INFO_H


//Process info for ps
struct proc_info{
  int pid;                     // Process ID
  int priority;                // Priority of process
  enum procstate state;        // Process state
  int rtime;                   // Process Run-Time
  int wtime;                   // Process waiting time
  int n_run;                   // Number of times Process is picked by Scheduler
  int cur_q;                   // Current queue number
  int num_ticks[5];            // Number of ticks received by process at each queue
};

#endif