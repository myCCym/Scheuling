function [ y ] = cost1( x )
y=x;
s=size(x,2);
for k=1:s
if x(k)<1
    y(k)=x(k);
else
    y(k)=1;
end
end



end

function y= cost2(x)
y=x;
s=size(x,2);
for k=1:s
y(k)=1-1/x(k);
end

end


