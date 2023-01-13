function l = aggregateLoad( jobs, x )
J=size(x, 1);
T=size(x, 2);
l = zeros(1, T);
for t=1:T
        a=0;
        for i=1:J
            for s=max(1,t+1-jobs(i).width):t
                a=a+x(i,s)*jobs(i).height;
            end
        end
        l(1,t)=a;
end
end

