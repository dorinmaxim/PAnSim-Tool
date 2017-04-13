function [ runableTaskSet ] = GenerateRunableTaskSetMultipleJobs( taskSet, nbJobs )

%still working on it

%takes as input a probabilistic task-set and the number of required jobs of the least priority task
%and outputs sequences of execution
%times and arrival times for each task, in order to schedule the task-set
%and obtain a resposne time

runableTaskSet = {};

wcrt=DeterministicWorstCaseResponseTimeComputation(probabilistic2deterministic(taskSet));

if wcrt==Inf
    wcrt = 10*max(taskSet{length(taskSet)}{2}(1,:));
end

%s = length(taskSet);

    limit=max( wcrt,max(taskSet{end}{2}(1,:)));
    
    
for i=1:length(taskSet)
          
    sequenceSize = ceil(nbJobs * limit/min(taskSet{i}{2}(1,:)));
    
%    if i~=length(taskSet)
        
        arrivalDistrib=CumDistribFunc(taskSet{i}{2});
        
        arrivalSequence = generateArrivalSequence(arrivalDistrib, sequenceSize);
        
        execDistrib=CumDistribFunc(taskSet{i}{1});
        
        execSequence = generateExecutionTimesSequence(execDistrib, sequenceSize);
        
        jobs = [arrivalSequence; execSequence];
        
        runableTaskSet{i} = jobs;
        
%     else
%         
%         arrivalDistrib=CumDistribFunc(taskSet{i}{2});
%         
%         arrivalSequence = generateArrivalSequence(arrivalDistrib, nbJobs-1);
%         
%         execDistrib=CumDistribFunc(taskSet{i}{1});
%         
%         execSequence = generateExecutionTimesSequence(execDistrib, nbJobs-1);
%         
%         jobs = [arrivalSequence; execSequence];
%         
%         runableTaskSet{i} = jobs;
%         
%     end
    
end




end

