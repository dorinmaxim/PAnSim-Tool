function [out]=dcf(A,B)

if isempty(A)
   A=[0; 1]; 
end

if isempty(B)
   B=[0; 1]; 
end
%Dorin convolution function
s=size(A,2);
res=[];
for i =1:s  
    tmp=B+[A(1,i)*ones(1,size(B,2)); 0*ones(1,size(B,2))];
    tmp = tmp .* [1 * ones(1,size(B,2)); A(2,i)*ones(1,size(B,2))];
    res=[res tmp];
end


%out = res;

out = sortRandVar(res);

% [t,idx] =sort(res(1,:),2);res=res(:,idx);
% init=res(1,1);
% out = [];
% while (find(res(1,:)==init))
%     out=[out [init ;sum(res(2,find(res(1,:)==init)),2)]];
%     res(:,find(res(1,:)==init))=[];
%     if size(res)
%         init = res(1,1);
%     end
% end


end