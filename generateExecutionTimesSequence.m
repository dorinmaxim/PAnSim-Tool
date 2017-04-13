function [ executions] = generateExecutionTimesSequence( pWCETdistrib, nbJobs )

%takes as input a PDF distribution and an integer
%outputs a sequence ofexecution times of lengths nbArrivals

executions=zeros(1,nbJobs+1);


if length(pWCETdistrib(1,:))==1
    for i=1:nbJobs+1
        executions(i)= pWCETdistrib(1,1);
    end
else
    
    
    for i=1:nbJobs+1
        
        randNb=rand;
        
        for j=1:length(pWCETdistrib(1,:))
            if randNb <= pWCETdistrib(2,j)
                executions(i)=pWCETdistrib(1,j);
                break
            end
        end
        
    end
    
end


end

