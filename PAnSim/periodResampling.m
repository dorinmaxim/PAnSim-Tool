function [ result ] = periodResampling( randVar, nbValues )

%resampling from the initial number of values to nbValues values





if nbValues<length(randVar(1,:))
    
    step = ceil(length(randVar(1,:))/nbValues);
    
    while length(randVar(1,:)) - step * (nbValues-1) < step
        
        step = step-1;
        
    end
    
    pas1 = length(randVar(1,:));
    
    pas2 = length(randVar(1,:)) - step + 1;
    
    
    result=[];
    
    %current = 1;
    
    for i = length(randVar(1,:)) : -1 : 1
        
        
        if i > pas2 & i <= pas1
            
            %randVar(1,i) = randVar(1,pas2);
            
            randVar(2,pas2) = randVar(2,pas2) + randVar(2,i);
            
        elseif i == pas2
            
            result=[randVar(:,pas2) result];
            
            pas1 = pas1-step;
            
            pas2 = pas2-step;
            
            if pas2<1
                pas2=1;
            end
            
            if pas1<1
                pas1=1;
            end
            
        end
        
        
        
    end
    
    %randVar = sortRandVar(randVar);
    
    
else
    
    
    result = randVar;
    
    
end




end

