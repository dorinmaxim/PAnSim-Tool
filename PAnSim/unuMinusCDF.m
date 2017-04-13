function [ out ] = unuMinusCDF( distrib )

%[ out ] = unuMinusCDF( distrib )

out=CumDistribFunc( distrib );

for i=1:length(out)
    out(2,i)=1-out(2,i);
end

out(:,end+1) = [out(1,end)+1; 0];

head = [out(1,1)-1; 1];

out= [head out];

end

