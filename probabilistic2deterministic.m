
%transform a probabilistic taskset to its worst case deterministic taskset

function [deterministicTaskSet] = probabilistic2deterministic (taskSet)

deterministicTaskSet = {};

for i =1:length(taskSet)
    
   deterministicTaskSet{i}(1) = max(taskSet{i}{1}(1,:));
   
   deterministicTaskSet{i}(2) = min(taskSet{i}{2}(1,:));
        
end  


%deterministicTaskSet;


end
