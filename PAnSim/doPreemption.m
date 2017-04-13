function [ respTime ] = doPreemption( respTime, period, executionTime )


intermediaryResults=[];
for i=1:length(period(1,:))
    
    
    preemption=period(:,i);
    preemptionvalue=preemption(1,1);
    preemptionpercent=preemption(2,1);
    fake=[0; preemptionpercent];
    
    [head,tail]=constructHeadTail(respTime,preemptionvalue);
    
    
    if isempty(tail)
        varinter1=[];
    else
        varinter1=dcf(tail,executionTime);
    end
    
    concat1 = cat(2,head,varinter1);
    resintermediaire = dcf(fake, concat1);
    
    %intermediaryResults=cat(2,intermediaryResults,resintermediaire);
    
    %intermediaryResults = mergeSameValues(intermediaryResults,resintermediaire);
    
    intermediaryResults = [intermediaryResults resintermediaire];
    
    
    
end


respTime = sortRandVar(intermediaryResults);

end

