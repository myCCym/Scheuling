function checkxi( xi )
%UNTITLED11 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
xi = roundn(xi,-4);
A=full(xi);
J=size(A, 1);
T=size(A, 2);
for j=1:J
    for t=1:T
        if roundn(A(j,t),-3)~=0 && roundn(A(j,t),-3)~=1
            j
            t
            A(j,t)
            error('hehe')
        end
    end
end


end

