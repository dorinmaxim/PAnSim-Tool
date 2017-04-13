%compute worst case respone time in a deterministic task-set


function [respTime] = DeterministicWorstCaseResponseTimeComputation (taskSet)


target = length(taskSet);


respTime = taskSet{target}(1);

respTimeProvizoriu = 0;

valori = zeros(1, target-1);

while respTime ~= respTimeProvizoriu % && respTime<taskSet{target}(2)
    
    respTimeProvizoriu = respTime;
    
    for i=1:length(valori)
        
        valori(i) = ceil(respTime/taskSet{i}(2)) * taskSet{i}(1);
        
    end
    
    respTime = taskSet{target}(1) + sum(valori);
    
end

end

%respTime;