PAnSim Tool by Dorin Maxim
-----------------------------


PAnSim is a Probabilistic Analysis and Simulation Tool meant to simulate and analyze real-time task-sets which have their parameters (i.e. WCET, periods) given as (probability) distributions.

The supported scheduling policy is FPPS (fixed priority preemptive scheduling).

Inputs are textual (task-set parameters) and outputs are numerical (lists of response times observed during simulation, probabilistic response time distributions in the form of random variables, etc) as well as graphical (gant chart of the runtime scheduling, plot of analytical/empirical exceedente distribution functions, etc).

PAnSim is implemented in Matlab by Dorin Maxim. Copyright is held by Dorin Maxim. 
PSnSim is free for academic use provided that proper credit is given (e.g. cited in publications). 


Using PAnSim
-----------------------------


To use PAnSim simply open the file Main.m in Matlab and change the task-set parameters to correspond to the task-set that you want to simulate. You may need to comment/uncomment some functions depending on what you want to use PAnSim for (e.g. simulation, analysis, simulation and analysis) and which results you want to plot (e.g. gant chart of the runtime scheduling, analytical and/or empirical exceedence distributions, etc).


