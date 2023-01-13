%system model
T=24; %timeline
D=5; %Max duration
J=8000; % Number of jobs
S=1; %Max job size

%data = data_18012209;
data = output;
data = data(1:J,:);


%Construct the job set
jobs=job.empty(J,0);
jobswidth=zeros(J, D);
for i=1:J
    jobs(i) = job(T, D, S, i);
    jobs(i).width = data(i,3)-data(i,1)+1;
    jobs(i).height = (data(i,4))/jobs(i).width;
    jobs(i).dictionary = zeros(T, T);
         
         for p=1:T
             for j=1:T
                 if p>=j && p<j+jobs(i).width
                     jobs(i).dictionary(p, j)=jobs(i).height;
                 end
                  
             end
         end
         
    jobs(i).window = (data(i,1): data(i,2)-jobs(i).width+1)+1;

    jobswidth(i, jobs(i).width) = 1;
end




fprintf('Go into Scheduling');

aux = ones(J, T);
for j=1:J
    for t=1:T
       if ismember(t,jobs(j).window)
           aux(j, t)=0;
       end
    end
end





%Cost function define: f(l_t)=k_t*l_t^2
%ce=rand(1,T);



%{
k=1000;
auxx = aux(1:k,:);
jobswidthh = jobswidth(1:k,:);


[x,l] = scheduling(jobs(1:k), T, ce, auxx);
[xi, li] = intScheduleOld(jobs(1:k), x, D, T, jobswidth);

[xf, lf] = nonflexiblescheduling(jobs(1:k), T);


ci=cost(li, ce);
cf=cost(lf, ce);
%}

compcost = zeros(20,2);
compavgcost = zeros(20,2);
compavgprice = zeros(20,3);
compavgsize = zeros(20,1);
delaycomp = zeros(10,1);


for k=2000:4000:4000

    auxx = aux(1:k,:);
    jobswidthh = jobswidth(1:k,:);

    tic;

    [x,l] = scheduling(jobs(1:k), T, auxx);
    [xi, li] = intScheduleOld(jobs(1:k), x, D, T, jobswidth);

    %delaycomp(k/200,1) = toc;

    [xf, lf] = nonflexiblescheduling(jobs(1:k), T);

   % compavgcost(k/200,1)=realcost(li)/sum(li);
    %compavgcost(k/200,2)=realcost(lf)/sum(lf);


   % compavgprice(k/200,1)=realcost(li)/sum(li);
   % compavgprice(k/200,2)=realcost(l)/sum(l);

   % compavgsize = abs(l-li) ;
    
    
   % tic;
    
    
    
    [xc,lc] = CVXMixedInt(jobs(1:k), T, auxx);
    l1 = [li;lc];
    l2 = [li;lf];

end



%tic;


%[x,l] = scheduling(jobs, T, ce, aux);


%[xi, li] = intScheduleOld(jobs, x, D, T, jobswidth);
%[xi, li] = intscheduling(jobs, x, D, T);
%[xc,lc] = CVXMixedInt(jobs, T, ce, aux);
%fprintf('CVX completes');
%[xr, lr] = rounding(jobs, x, D, T);

%toc

%tic;
%[xc,lc] = CVXMixedInt(jobs, T, ce, aux);
%toc

% Total cost
%cost(l, ce)

%cost(li, ce)

%cost(xc, lc)

%sum(abs(l-li))


%Pricing
%P = price(l, ce);
