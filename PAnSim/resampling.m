function [ result ] = resampling( randVar, nbValues )

%resampling from the initial number of values to nbValues values





if nbValues<length(randVar(1,:))
    
    step = ceil(length(randVar(1,:))/nbValues);
    
    
    while length(randVar(1,:)) - step * (nbValues-1) < step
        
        step = step-1;
        
    end
    
    
    pas1 = 1;
    
    pas2 = step;
    
    
    result=[];
    
    %current = 1;
    
    for i=1:length(randVar(1,:))
        
        
        if i >= pas1 & i < pas2
            
            %randVar(1,i) = randVar(1,pas2);
            
            randVar(2,pas2) = randVar(2,pas2) + randVar(2,i);
            
        elseif i == pas2
            
            result=[result randVar(:,pas2)];
            
            pas1 = pas1+step;
            
            pas2 = pas2+step;
            
            if pas2>length(randVar(1,:))
                pas2=length(randVar(1,:));
            end
            
            if pas1>length(randVar(1,:))
                pas1=length(randVar(1,:));
            end
            
        end
        
        
        
    end
    
    %randVar = sortRandVar(randVar);
    
    
else
    
    
    result = randVar;
    
    
end



end

