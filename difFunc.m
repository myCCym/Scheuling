function dif = difFunc( s )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
dif=zeros(s,s);
for i=1:s
    for j=1:s
        if abs(i-j)==1
            dif(i, j)=1;
        end
        if abs(i-j)==0
            dif(i, j)=3;
        end
    end
end



end

