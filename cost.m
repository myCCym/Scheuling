function y = cost( l , ce)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   x: 1 3
y = l*diag(ce)*transpose(l);
%y=x.*(x>=0 & x<lpEnergy)+(lpEnergy+2*(x-lpEnergy)).*(x>=lpEnergy & x<(hpEnergy+lpEnergy))+(lpEnergy+2*hpEnergy+3*(x-lpEnergy-hpEnergy)).*(x>=(hpEnergy+lpEnergy));

end
