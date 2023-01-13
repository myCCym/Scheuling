function [ edges, num] = findEdgeSet(sch, d, jobswidth, isFracX)


x=sch;
T=size(sch,2);
%edges = edge.empty(T, 0);
edges = zeros(T,3);
num=0;



%isFracX = (x ~= 0) .* (x ~= 1);
%the index of jobs with non-integer schedule
jobsNI = find(sum(isFracX, 2)>1);
%the index of jobs with width d
jobsd = find(jobswidth(:,d)==1);

jobsdNI = intersect(jobsNI, jobsd);

%if size(jobsdNI, 1)<T
 %   return
%end


for i=1:size(jobsdNI, 1)
            %the total round of for loop is upper bound by T
            j = jobsdNI(i);
            column = find(isFracX(j,:)==1);
            for k=2:size(column,2)
                num = num+1;
                %edges(num) = edge(j, column(1), column(k));
                edges(num,:) = [j, column(1), column(k)];
                
                if num>=T
                    return
                end
            end

end
        
        
        
        
        
end

