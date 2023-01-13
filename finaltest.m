hmin=10000;
hmax = 0;
for i=1:8000
    if hmin>jobs(i).height
    
        hmin=jobs(i).height;
    end
    if hmax<jobs(i).height
        if jobs(i).height>=8
            i
            continue
        end
        hmax=jobs(i).height;
    end

end