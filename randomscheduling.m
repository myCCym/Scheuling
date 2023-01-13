function  [schedule,load]  = randomscheduling(jobs, T, ce, aux)
% relaxation scheduling
J=size(jobs,2);
cvx_solver Mosek
cvx_begin
    variables x(J, T) l(1, T)
    expression a(T, 1)
    minimize( cost(l, ce) )
    subject to
   % for t=1:T
      %  a=0;
       % for j=1:J
          %  for s=max(1,t+1-jobs(j).width):t
            %    a=a+x(j,s)*jobs(j).height;
          %  end
      %  end
       % l(1,t)==a;
   % end
    
    a=zeros(T, 1);
    for j=1:J
         a=a+jobs(j).dictionary*transpose(x(j,:));
    end
    l==transpose(a);
    
    sum(transpose(x)) == ones(size(sum(transpose(x))));
 
    
  %  for j=1:J
      %  for t=1:T
          % if ismember(t,jobs(j).window)
        %       x(j,t)>=0;
       %    else
      %         x(j,t)==0;
     %      end
     %   end
   % end  
    
   aux.*x ==0;
   x>=0;
   
cvx_end
schedule=x;
load=l;

 %a=zeros(T, 1);
        
   % for j=1:J
   %     a=a+j.dictionary*(x(j,:).');
   % end
    
   % l==a.';


end

