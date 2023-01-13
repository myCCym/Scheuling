function [ jbs ] = jobpacking( consumption, id)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
    T=24;
    jbs = job(10,1,1,1);

    jbs.id = id;
    jbs.width = 1;
    jbs.height = sum(consumption(:,2));
	% window size: 0-8
	jbs.dictionary = zeros(T, T);
         
	for i=1:T
        for j=1:T
            if i>=j && i<j+jbs.width
                     jbs.dictionary(i, j)=jbs.height;
            end
                  
        end
    end
         
         ta = min(consumption(:,1))+1;
         ts = max(consumption(:,1))+1;
         jbs.window = (ta: min(ts, T- jbs.width));
         jbs.state = 0;    
    

end

