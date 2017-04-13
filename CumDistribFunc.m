function [ out ] = CumDistribFunc( distrib )

out=zeros(2,length(distrib(1,:)));

    for i=1:length(distrib(1,:))
    
        if i==1
            out(:,i)=distrib(:,i);
        else    
            out(1,i) = distrib(1,i);
            out(2,i) = out(2,i-1) + distrib(2,i);
        end    
        
    end    

end

