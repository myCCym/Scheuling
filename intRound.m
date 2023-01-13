function [ x ] = intRound(jobs, x, ids, times )
%
delta=1000;
sz = size(ids, 2);

% find delta
for k=1:sz
    j=ids(k);
    h = jobs(j).height;
    if h*x(j,times(k))<delta
        delta = h*x(j,times(k));
    end
end

%round
for k=1:sz
     j=ids(k);
     h = jobs(j).height;
     x(j,times(k))=x(j,times(k))-delta/h;
     x(j,times(k+1))=x(j,times(k+1))+delta/h;
end


end

