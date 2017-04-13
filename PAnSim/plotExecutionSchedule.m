function [] = plotExecutionSchedule (runableTaskSet, g) 


l=length(g(1,:));


%plot the results


s=length(g(:,1));%+1;

x=[1:l]-0.5;
figure;
hold all

%plot the schedule



for i=1:s
  
    subplot(s,1,i)
    hold all
    bar(x,g(i,:)*0.5,'EdgeColor','flat')
    hold all
    set(gca,'XLim',[0 length(g(1,:))],'Ytick',0:0.1,'YLim',[0 1])
    hold all
    bar(runableTaskSet{i}(1,:),ones(1,length(runableTaskSet{i}(1,:))),0.01,'g', 'EdgeColor', 'g')
    hold all
end


end