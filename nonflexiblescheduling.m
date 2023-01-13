function  [schedule,load]  = nonflexiblescheduling(jobs, T)
% relaxation scheduling
J=size(jobs,2);


   x = zeros(J,T);
   for j=1:J
      x(j, jobs(j).window(1))  = 1;
   end

   a=zeros(T, 1);
    for j=1:J
         a=a+jobs(j).dictionary*transpose(x(j,:));
    end
   l=transpose(a);
    
   schedule = x;
   load = l;

end

