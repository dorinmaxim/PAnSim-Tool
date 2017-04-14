function [ respTimeValues2, grafic, outputRunableTaskSet] = simulateStopAtDeadline( taskSet, nbJobs )

%in this simulator, jobs are NOT allowed to continue execution past their
%repective deadlines, i.e. they are stopped at deadline if they didn't
%finish execution

NumberOfAnalyzedJobs=0;
marimeSet = length(taskSet);

deadline = max(taskSet{marimeSet}{2}(1,:)) + 1;

deadlineMisses = 0;

respTimeValues2 = cell(1,marimeSet);

wcrt=DeterministicWorstCaseResponseTimeComputation(probabilistic2deterministic(taskSet));

if wcrt==Inf
    wcrt = 2*deadline;
end

runableTaskSet = GenerateRunableTaskSetMultipleJobs(taskSet, nbJobs);

outputRunableTaskSet=runableTaskSet;

grafic = zeros(marimeSet, wcrt);

limit=max(wcrt*(nbJobs+2),runableTaskSet{marimeSet}(1,end)*(nbJobs+2));


for t=0:limit
    
   
    for i=1:length(runableTaskSet(1,:))
        
        if  t==runableTaskSet{i}(1,1)+min(taskSet{i}{2}(1,:))
        
             respTimeValues2{1,i} = [respTimeValues2{1,i} deadline];
             deadlineMisses=deadlineMisses+1;
                    
                    if i==marimeSet
                        NumberOfAnalyzedJobs =  length(respTimeValues2{1,end}(1,:));
                    end
                    
            
            runableTaskSet{i}(:,1) = [];
            
            
        end
        
    end
        
    for i=1:length(runableTaskSet(1,:))
        
        if t>=runableTaskSet{i}(1,1)
            
            
            runableTaskSet{i}(2,1) = runableTaskSet{i}(2,1) - 1;
            
            grafic(i,t+1) = 1;
            
            if  runableTaskSet{i}(2,1) == 0
                
                    respTimeValues2{1,i} = [respTimeValues2{1,i} t-runableTaskSet{i}(1,1)+1];
                    
                    if i==marimeSet
                        NumberOfAnalyzedJobs =  length(respTimeValues2{1,end}(1,:));
                    end
                
                runableTaskSet{i}(:,1) = [];
                               
            end
            
            break;
                        
        end
        
    end
    
    if   isempty(runableTaskSet{marimeSet}(1,:))
        break;
    end
    
    if NumberOfAnalyzedJobs==nbJobs
        break
    end
    
    
end


deadlineMisses;

end

