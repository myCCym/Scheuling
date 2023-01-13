

function [ xnum, ytime, ycost ] = Simulation(minnum, maxnum)
interval = 100;

%xnum:  x-axis, the number of jobs, from minmum to maxnum with gap interval
%ytime: ytime(1,:) is the running time of our algorithm; ytime(2,:) is 
%mixed integer solver.
%ycost: ycost(1,:) is the cost of our algorithm; ycost(2,:) is mixed solver
%(optimal integer solution); ycost(3,:) is optimal relaxed solution 

%Cost function: cost.m, \sum l(t)^2 
 

T=24; %timeline
D=5; %Max duration
S=1; %Max job size


%coefficient of cost function
%ce=rand(1,T);
ce = ones(1,T);
ll=1+(maxnum-minnum)/interval;

xnum = zeros(1, ll);
for i=1:ll
    xnum(1,i)=minnum+interval*i-interval;
end



ytime=zeros(3, ll);
ycost=zeros(3, ll);



nums=minnum;
kk=1;
while nums <= maxnum
    J=nums;
    
    jobs=job.empty(J,0);
    jobswidth=zeros(J, D);
    for i=1:J
        jobs(i) = job(T, D, S, i);
        jobswidth(i, jobs(i).width ) = 1;
    end
    
    aux = ones(J, T);
    for j=1:J
        for t=1:T
            if ismember(t,jobs(j).window)
                aux(j, t)=0;
            end
        end
    end

   
    
    t1=clock;
    lc=zeros(1, T);
    %[~ , lc] = CVXMixedInt(jobs, T, ce, aux);
    t2=clock;
    ytime(2, kk) = etime(t2, t1);
    
    t1=clock;
    %[x, l] = scheduling(jobs, T, ce, aux);
    %fprintf('CVX completes');
    %[xi, li] = intScheduleOld(jobs, x, D, T);
    %[~, li] = intscheduling(jobs, x, D, T);

   % [xi, li] = intscheduling(jobs, x, D, T);
    t2=clock;
    ytime(1, kk) = etime(t2, t1);
    

    [x, l] = scheduling(jobs, T, ce, aux);
    fprintf('CVX completes');
    %[xi, li] = intScheduleOld(jobs, x, D, T);
    %[~, li] = intscheduling(jobs, x, D, T);
    
    t1=clock;
    [xi, li] = intScheduleOld(jobs, x, D, T, jobswidth);
    t2=clock;
    ytime(3, kk) = etime(t2, t1);

    
   % [x, l] = scheduling(jobs, T, ce, aux);
  %  [xr, lr] = rounding(jobs, x, D, T);
    
    
    ycost(1,kk) = cost(li, ce);
    ycost(2,kk) = cost(lc, ce);
    ycost(3,kk) = cost(lc, ce) ;
    %+D*T*S*max(ce)
    
    kk = kk+1;
    nums = nums+interval;
end
end

