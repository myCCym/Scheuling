 
%the price of clean energy is 1, the price of burning energy is 2, the
%price of extra energy is 3.
function y=piesewiseCost(x, lpEnergy, hpEnergy)
y=x.*(x>=0 & x<lpEnergy)+(lpEnergy+2*(x-lpEnergy)).*(x>=lpEnergy & x<(hpEnergy+lpEnergy))+(lpEnergy+2*hpEnergy+3*(x-lpEnergy-hpEnergy)).*(x>=(hpEnergy+lpEnergy));
end 