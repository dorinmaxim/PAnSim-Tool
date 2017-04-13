function [head,tail] = constructHeadTail( randVar , arrival )


%fait un tableau de boolean
%1 dans head 0 dans tail
boolean_head_tail = le(randVar(1,:),arrival);

%parcours et crée head et tail
head=[];
tail=[];
for j=1:length(boolean_head_tail)
    current=randVar(:,j);
    if(boolean_head_tail(j)==1)
        
        head= cat(2,head,current);
    else
      
        tail =cat(2,tail,current);
    end
    
end

end

