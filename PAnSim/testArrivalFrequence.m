function [ arrivalFrequence ] = testArrivalFrequence( interArrivalDistances )


arrivalFrequence = zeros(2,1);

%length(interArrivalDistances(1,:))


for i=1:length(interArrivalDistances(1,:))
    
   if i==1
       arrivalFrequence(1,1)=interArrivalDistances(1,i);
       arrivalFrequence(2,1)=arrivalFrequence(2,i)+1;
   else
%       length(arrivalFrequence(1,:));
       for j=1:length(arrivalFrequence(1,:))
           if arrivalFrequence(1,j)==interArrivalDistances(1,i);
               arrivalFrequence(2,j)= arrivalFrequence(2,j)+1;
               break;
           end
           
%            j;
%            length(arrivalFrequence);
%            arrivalFrequence(1,j);
%            interArrivalDistances(1,i);
           if ( j==length(arrivalFrequence(1,:)) &&  arrivalFrequence(1,j)~=interArrivalDistances(1,i) )
               arrivalFrequence(1,j+1)=interArrivalDistances(1,i);
               arrivalFrequence(2,j+1)=1;
           end
       end
   end

       
    
end

arrivalFrequence(2,:)=arrivalFrequence(2,:)/length(interArrivalDistances(1,:));
end

