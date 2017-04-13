function [ respTime ] = probabilisticWorstCaseResponseTime( taskSet, nbOfPeriods, ETthreshold, MITthreshold )

format longE

target = length(taskSet);
respTime=taskSet{target}{1};


for i=1:target-1
    respTime = dcf(respTime,taskSet{i}{1});
end

if ETthreshold > 0
    respTime = resampling(respTime,ETthreshold);
end


interval = {};

for i=1:target-1
    interval{i} = taskSet{i}{2};
    
    if MITthreshold > 0
        interval{i} = periodResampling(interval{i}, MITthreshold);
    end
    
end



for i=1:2*nbOfPeriods*max(taskSet{target}{2}(1,:))
    

    for j=1:target-1
        
        if max(respTime(1,:)) > min(interval{j}(1,:)) && min(interval{j}(1,:)) == i
            
            respTime = doPreemption(respTime, interval{j}, taskSet{j}{1});
            
            if ETthreshold > 0
                respTime = resampling(respTime,ETthreshold);
            end
            
            
            
            interval{j}=dcf(interval{j},taskSet{j}{2});
            
            if MITthreshold > 0
                interval{j} = periodResampling(interval{j}, MITthreshold);
            end
            
        end
        
    end
    
    
end


respTime  = sortRandVar(respTime);

%bar(respTime(1,:), respTime(2,:))





end

