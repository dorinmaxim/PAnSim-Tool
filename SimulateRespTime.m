function [ respTime ] = SimulateRespTime( setToAnalyze )
contor2=0;
respTime=0;
taskSet = setToAnalyze;
%A=length(taskset(1,:));

%wcrt=DeterministicWorstCaseResponseTimeComputation(probabilistic2deterministic(taskSet));

while contor2==0
    %A=length(taskset(1,:));
    %B=length(taskset(length(taskset(1,:))));
    for t=0:12
        %         t;
        contor = 0;
        for i=1:length(taskSet(1,:))
            %if contor == 0
            %             i;
            verif=taskSet{i}(1,1);
            if t>=verif
                
                contor = 1;
                taskSet{i}(2,1) = taskSet{i}(2,1) - 1;
                respTime = respTime + 1;
                
                if i==length(taskSet(1,:)) && taskSet{i}(2,1) == 0
                    contor2=1;
                else if taskSet{i}(2,1) == 0
                        taskSet{i}(:,1) = [];
                    end
                    
                    %if contor==1
                    break
                    %end
                    
                end
                
                if contor==1 || contor2==1
                    break
                end
                % end
            end
            if contor2==1
                break
            end
        end
        if contor2==1
            break
        end
    end
    
    respTime;
    
end

