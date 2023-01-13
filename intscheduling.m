function  [intsch, load]  = intscheduling(jobs, sch, D, T)
% find the integer schedule using the relaxed solution (not the algorithm designed in the paper)
J=size(jobs,2);
tsch = zeros(D,T);
intsch = zeros(J,T);
load = zeros(1, T);
for i=1:J
    d = jobs(i).width;
    for t = 1:T
       tsch(d,t) = tsch(d,t)+sch(i,t)*jobs(i).height; 
    end
end

for d = 1:D
    wlt=0;
    for t = 1:T
      wt =  tsch(d,t)-wlt;
      while wt>0
         i = findjob(jobs, d, t, T); 
         if i==0
             break
         end
         intsch(i, t)=1;
         jobs(i).state = 1;
         wt = wt-jobs(i).height;
      end
      wlt = wt;
    end
end



 for t=1:T
        a=0;
        for i=1:J
            for s=max(1,t+1-jobs(i).width):t
                a=a+intsch(i,s)*jobs(i).height;
            end
        end
        load(1,t)=a;
 end
 


end

