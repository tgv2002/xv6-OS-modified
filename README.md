
# ASSIGNMENT 5 - ENHANCING xv6 OS

## Compiling and running the code

1. Run the command: `make clean; make qemu-nox SCHEDULER=<scheduler>`, to compile and run the code.
2. The macro SCHEDULER only takes the values - FCFS (First Come First Serve), RR (Round-Robin: default), PBS (Priority Based Scheduling), MLFQ (Multi Level Feedback Queue).

## waitx syscall

1. As a part of this syscall, three fields have been added to the existing proc structure - ctime: which describes when process is created, rtime: which describes total runtime of process, wtime: which describes total waiting time of process.
2. ctime is updated when process is allocated in `allocproc()`, etime is updated when process exits in `exit()`, and rtime is incremented by one for every clock tick, via the function `allTimeUpdate()`, which is called when clock interrupt occurs (for every tick).
3. The waitx syscall, functions similar to wait syscall, except that it additionally returns the total runtime and total waiting time of process. 
4. Run time returned is the same as value of field rtime for process, whereas the waiting time is the interval between creation and exit of process, in which it was not sleeping (as a process, if allocated and not exited, can either be running or sleeping or waiting). The field `stime`, which stores total sleeping time, has also been added in proc structure to facilitate this.
5. The test program 'time.c' utilizes this waitx system call. It takes atleast one argument, and executes them in the required way, and displays the return values of waitx syscall. The command `time <arguments...>` can be executed.

## ps

1. A new structure `proc_info` has been defined to facilitate required information for ps, and a new syscall called 'psCall' has been defined for the same. The structure contains only a subset of fields in proc structure, and it is defined in `proc_info.h`, which is included wherever needed.
2. When ps is entered, the user program 'ps.c' passes control to the psCall syscall, which takes an array of structures of type `proc_info`, and populates this array with all the necessary information from process table in proc.c.
3. Now this call returns to user program, where the array has been filled with necessary values. This information is formatted and displayed.
4. Note that the default priority for every process irrespective of scheduling policies, is 60.
5. The field `cur_q` for every process is either a valid number between 0 and 4 or is -1 (if the scheduling policy is not Multi-level feedback queue, or the process is not running or runnable). The number of ticks in each queue is always 0, if the scheduling policy is not MLFQ.
6. wtime is reset to 0 everytime when process is chosen to run or changes its position in queue. It is calculated as the difference between current time and the sum of previous execution time and sleeping time (in current window, between being run twice). The field `slice_sleep` facilitates this.  
7. The command to execute is `ps`.

## Scheduling policies

### Round Robin (RR)

1. This is the default scheduling policy which is already implemented.
2. Its `wtime` (process wait time), `n_run` (number of times process is chosen ti run), `slice_sleep` (process sleeping time since last execution) are updated appropriately. Note that this is also updated for every scheduling policy mentioned below.

### First Come First Serve (FCFS)

Note - This scheduling policy is implemented in a non-preemptive manner.

1. We iterate through all the processes which are ready to execute, in the process table, and store the process which has the smallest creation time (ctime) in all of them, as this is the one which was created first.
2. Now this process (if found any), will be chosen to execute and CPU will be allocated to it.

### Priority Based Scheduling (PBS)

Note - This scheduling policy is implemented in a preemptive manner.

1. We iterate through all the processes which are ready to execute, in the process table, and store the process and the priority of that process which has the smallest value in priority field as smallest value indicates highest priority in all processes.
2. Now if a minimum priority value (high priority) is found, then we iterate through the whole process table once, and thus execute the processes which have this priority value, in order. This is to ensure that the same process with that priority is not chosen over and over again (to ensure proper Round-Robin Scheduling).
3. After a particular process chosen above yields after clock interrupt, another iteration throughout process table is done, to check if meantime any higher priority process has entered / modified such that it's better than current high priority. If yes, we break out of these loops, so that this algorithm can be used again; Otherwise, we just continue with above step.
4. A syscall `set_priority()` is implemented which takes the arguments - new priority and process ID (to which this should be assigned). It yields if this new priority is smaller in value than previous one. It updates the priority if its in valid range.
5. The above syscall is utilized by user program 'setPriority.c', which takes the two arguments of `set_priority()` and displays the new priority of that process, if updated. An assumption is made that if a negative value / value with undesirable symbols is entered as value for `new_priority / pid`, it is treated as 0. 
6. The command `setPriority <new_priority> <pid>` can be used to invoke.

### Multi-Level Feedback Queue (MLFQ)

Note - This scheduling policy is implemented in a preemptive manner.

1. The implementation of queue is simulated with the help of updation of variables like `cur_q` and `curr_ticks` and the fact that they are iterated through in order (while iterating through process table). This works because relative ordering of processes in a queue-type remain unaltered, as we always iterate through process table in order.
2. For this execution, the fields `cur_q` and `curr_ticks` are exploited to check the current queue of process and the number of ticks expired in its time slice respectively.
3. Initially, all the processes are in queue 0 (high priority), but they are demoted to the queue below if their time slice expires. Fields are updated accordingly.
4. Ageing is implemented via the function `ageHere()` which ensures that no process has waited for more than 300 timer ticks. If so, it will be promoted in the queue.
5. Note that when the process yields and is about to sleep, it still remains in the same queue.
6. We iterate through all processes for all the five types of queues (higher priority 0 first, and 4 in the end), and chose the first process we find to execute, and allocate CPU to it.
7. An important aspect to make note is that, a process can exploit this policy by yielding just before its time slice expires, so that it still remains in the same queue. This process can relinquish control now by getting a new time-slice again.

## Additional Helper functions

1. The function `ageHere()` is used, whose functionality is mentioned above.
2. The function `mlfqUpdates()` updates the `curr_ticks` of process, that is the number of timer ticks passed in current time slice (if the process is running). It also updates number of ticks for the process in the queue it is present in. Note that this pertains only to MLFQ scheduling policy.
3. The function `allTimeUpdate()` is used to update the runnig time (if process is running), sleeping time (if process is sleeping), and process wait time, for every clock interrupt. It is named so as it updates many fields associated to time.

### Performance comparison of scheduling policies

#### Assumptions:

1. In the file 'types.h', there is a flag named `POLICYCOMP`, which is set to 0, by default. To print the execution time for a scheduling policy, this flag should be set to 1 in 'types.h', and we should re-compile and run again.
2. It is assumed that, once the code is running, the first command to enter is `perfComp <processType> <processCount>` (for performance comparison), so that output of number of ticks taken for execution is printed (This is needed because the pid value '3' is hardcoded for comparing ticks' values). More about the command is explained below.

#### Analysis and Testing:

1. The command `perfComp <processType> <processCount>` can be run for all the four scheduling policies, to get the execution time of the complete execution. The file 'perfComp.c' takes the above inputs and creates required number of processes of given type, this can be used for relative comparisons of scheduling policies.
2. The processType can take only two values - 0 (means all CPU bound processes are created) and 1 (means all I/O bound processes are created). The processCount can take any non-negative value which is not large. All the 'processCount' process' type is determined the argument processType.
3. It is observed that on running the command, `perfComp 0 5`, (that is 5 CPU-bound processes), for all 4 scheduling policies, one output observation for all 4 policies is (it might vary):

RR : The execution consumed a total of 3378 timer ticks.
PBS : The execution consumed a total of 3311 timer ticks.
FCFS : The execution consumed a total of 2918 timer ticks.
MLFQ : The execution consumed a total of 3447 timer ticks.


4. It is observed that on running the command, `perfComp 1 5`, (that is 5 I/O-bound processes), for all 4 scheduling policies, one output observation for all 4 policies is (it might vary):

FCFS : The execution consumed a total of 4283 timer ticks.
MLFQ : The execution consumed a total of 4483 timer ticks.
RR : The execution consumed a total of 4296 timer ticks.
PBS : The execution consumed a total of 4559 timer ticks.

5. Based on the relative comparison, after testing for a large number of cases, it is observed that the four scheduling policies didn't differ by a very large margin because of the similar nature and type of processes.
6. In many attempts, Round Robin proved to be the best scheduling policy, because of the optimal utilization of CPU and I/O resources by all processes, almost equally. First Come First Serve (FCFS) and Priority-based Scheduling (PBS) had somewhat similar results, and PBS depended on the priority assignments, and FCFS consumes considerable CPU-time because of non-preemptive nature. The complexity and overhead of Multi-Level Feedback Queue (MLFQ) consumed considerable time at few instances, but its results were similar to above two policies in sufficient cases.

Note - The file 'benchmark.c' is included so as to facilitate and observe the order of execution of processes and check their time taken. The command `benchmark` can be used for this purpose, and to get the waiting time and run time, `time benchmark` can be used.
