% Main file to run the PAnSim tool

%% declare task-set. 
% Priorities are given in the order in which tasks are placed in the set, 
% e.g. taskSet{1} is the highest priority and taskSet{end} has the lowest
% priority. The shedulign poricy is FPPS (fixed priority preemptive scheduling) 

c1=[2; 1]; t1=[5, 6; 0.2, 0.8];
tau1={c1, t1};

c2=[3, 4; 0.9, 0.1]; t2=[7; 1];
tau2={c2, t2};

taskSet={tau1, tau2};

%% do simulation
%number of jobs of the lowest priority task to simulate

numberOfJobsToSimulate = 10000;

%there are two possible approaches regarding what happens when a job
%misses a deadline: to continue the job or to abort it. The appropriate
%fucntion below should be activated while the unused one should be commented

%[responseTimes, grafic, jobs] = simulateExecutionOfPRTSMultipleJobsContinuePastDeadline( taskSet, numberOfJobsToSimulate );

[responseTimes, grafic, jobs] = simulateExecutionOfPRTSMultipleJobsStopAtDeadline( taskSet, numberOfJobsToSimulate);


%% plot the schedule
% uncomment to plot the execution schedule

%plotExecutionSchedule(jobs, grafic)


%% analyze the task-set

stopAnalysisWhenDeadlineIsReached=1;
pWCETresampling = 0;
pMITresampling = 0;

pWCRT = probabilisticWorstCaseResponseTime(taskSet, stopAnalysisWhenDeadlineIsReached, pWCETresampling, pMITresampling);

%% plot the results for the least prioritary task in the set

%% plot theoretical distribution in 1-CDF form

uCDF=unuMinusCDF(pWCRT);
figure; hold all;
plot(uCDF(1,:),uCDF(2,:));

%% plot empirical distribution observed during simulation

plotEmpiricalDistribution(responseTimes{end})

% add legend to the figure

legend('Theoretial','Empirical')

