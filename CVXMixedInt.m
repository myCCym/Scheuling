function  [schedule,load]  = CVXMixedInt(jobs, T, aux)
% relaxation scheduling
J=size(jobs,2);
cvx_solver Mosek
cvx_begin
    variable x(J, T) binary
    variable l(1, T)
    expression a(T, 1)
    minimize( realcost(l) )
    subject to
    
    a=zeros(T, 1);
    for j=1:J
         a=a+jobs(j).dictionary*transpose(x(j,:));
    end
    l==transpose(a);
    
    sum(transpose(x)) == ones(size(sum(transpose(x))));
    
    
    
   aux.*x ==0;
   x>=0;
   
cvx_end
schedule=x;
load=l;


end