function y= cost2(x)
y=x;
s=size(x,2);
for k=1:s
y(k)=1-pow_p((1+x(k)),-2);
end

end
