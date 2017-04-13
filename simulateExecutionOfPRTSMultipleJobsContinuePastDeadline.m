function [ respTimeValues2, grafic , outputRunableTaskSet] = simulateExecutionOfPRTSMultipleJobsContinuePastDeadline( taskSet, nbJobs )

%in this simulator, jobs are allowed to continue execution past their
%repective deadlines

NumberOfAnalyzedJobs=0;
marimeSet = length(taskSet);

wcrt=DeterministicWorstCaseResponseTimeComputation(probabilistic2deterministic(taskSet));

runableTaskSet = GenerateRunableTaskSetMultipleJobs(taskSet, nbJobs);

outputRunableTaskSet = runableTaskSet;

grafic = zeros(marimeSet, wcrt);

respTimeValues2 = cell(1,marimeSet);


limit=max(wcrt*(nbJobs+2),runableTaskSet{marimeSet}(1,end)*(nbJobs+2));


    for t=0:limit
       
       
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
    
end

