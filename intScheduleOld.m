function [x, l] = intScheduleOld( jobs, x, D, T , jobswidth )

J=size(x, 1);
% Integer scheduling function (provided in paper)
edges = zeros(T,3);

x=roundn(x,-3);
isFracX = (x ~= 0) .* (x ~= 1);

for d=1:D
    while 1
    %find some edges (|E|<=T)

    %[ edges,edgesnum] = initEdgeSet(jobs, x, d);
        
    
    [ edges,edgesnum] = findEdgeSet(x, d, jobswidth, isFracX);


    if edgesnum<T
        break
    end
    
    %find a cycle

    [ids, times, indicator] = findCycleImp(edges, T);


    if indicator==0
        break
    end
    %round
    

    x = intRound(jobs, x, ids, times);
    x(edges(:,1),:)=roundn(x(edges(:,1),:),-3);
    isFracX(edges(:,1),:)=(x(edges(:,1),:) ~= 0) .* (x(edges(:,1),:) ~= 1);


    end
end




%schedule with propobility
for j=1:J
    order = randperm(T); 
    for t=1:T
        %There is a tiny trick: we set 0.1 not 0 to avoid the case where
        %x(j,t)=xx*10^-8..
        if x(j,order(t))>0.001
            x(j,order(t))=1;
            for k=t+1:T
                 x(j,order(k))=0;
            end
            break;
        end
    end
end


a=zeros(T, 1);
    for j=1:J
         a=a+jobs(j).dictionary*transpose(x(j,:));
    end
l=transpose(a);



end

