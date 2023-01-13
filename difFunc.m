function dif = difFunc( s )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
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

