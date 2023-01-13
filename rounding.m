function [x, l] = rounding( jobs, x, D, T )

J=size(x, 1);

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

l = aggregateLoad(jobs, x);



end

