function c = piecewisecost(l,ce)
%UNTITLED 此处提供此函数的摘要
%   此处提供详细说明
c= sum(max(10*(l-4./ce)+4*4./ce, 4*l)); 

end