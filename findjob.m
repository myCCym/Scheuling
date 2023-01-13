function [ id ] = findjob( jobs, d, t, T )
i = 0;
J = size(jobs, 2);
endslot = T;
for j =1:J
    if jobs(j).state==0
        if jobs(j).width==d 
            if ismember(t,jobs(j).window)
                if max(jobs(j).window)<=endslot
                    i = j;
                    endslot = max(jobs(j).window);
                end
            end
        end
    end
end


id = i;

end

