function [ sortedVar ] = sortRandVar( var )


[t,idx] =sort(var(1,:),2);var=var(:,idx);
init=var(1,1);
sortedVar = [];
while (find(var(1,:)==init))
    sortedVar=[sortedVar [init ;sum(var(2,find(var(1,:)==init)),2)]];
    var(:,find(var(1,:)==init))=[];
    if size(var)
        init = var(1,1);
    end
end


end

