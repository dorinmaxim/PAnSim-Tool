function [ arrivalTimes ] = generateArrivalSequence( pMITdistrib, nbArrivals )

%takes as input a CDF distribution and an integer
%outputs a sequence of arrival times of lengths nbArrivals

arrivalTimes=zeros(1,nbArrivals+1);
%periods=zeros(1,nbArrivals);


if nbArrivals~=0
    
    if length(pMITdistrib(1,:))==1
        for i=1:nbArrivals
        arrivalTimes(i+1)=arrivalTimes(i) + pMITdistrib(1,1);
        end
    else
        
        for i=1:nbArrivals
            
            randNb=rand;
            
            for j=1:length(pMITdistrib(1,:))
                if randNb <= pMITdistrib(2,j)
                    arrivalTimes(i+1)=arrivalTimes(i) + pMITdistrib(1,j);
                    %periods(i)=pMITdistrib(1,j);
                    break
                end
            end
            
            
        end
        
        
    end
    
    
end

