function [ edges, nums ] = initEdgeSet(jobs, sch, d)
x=roundn(sch,-3);
J=size(sch,1);
T=size(sch,2);
edges = edge.empty(T, 0);
nums = 0;


for j=1:J
    if jobs(j).width==d
    for t=1:T
        if x(j,t)>0 && x(j,t)~=1
            s=t;
            for k=s+1:T
                if x(j,k)>0 && x(j,k)~=1
                    nums = nums+1;
                    edges(nums) = edge(j, s, k);
                end
                if nums==T
                    return
                end
                break
            end
            break
        end
    end
    end
end


return

end

