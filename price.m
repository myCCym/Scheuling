function P = price( l, ce )
% ce: constant coefficient
for t=1:size(l,2)
    P(t)=2*l(t)*ce(t);
end

end

