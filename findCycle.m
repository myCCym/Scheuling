function [ ids, times, indicator] = findCycle( edges, T)
%example
%jobs [1,2,3], time [1,2,4]
%cycle job1:1->2; job2:2->4; job3:4->1

ids=[];
times=[];
indicator=0;

%delete edge (a,b) where d(a)=1 or d(b)=1. d() means the degree.
%then we can start from any edge.

ee=edges; 

degree = zeros(1, T);
for k=1:size(ee, 2)
       degree(ee(k).s)=degree(ee(k).s)+1;
       degree(ee(k).e)=degree(ee(k).e)+1;
end

while 1
   idc=0;
   for i=1:T 
       if degree(i)==1
            for k=1:size(ee, 2)
                 if ee(k).s==i||ee(k).e==i
                     degree(ee(k).s) = degree(ee(k).s)-1;
                     degree(ee(k).e) = degree(ee(k).e)-1;
                     ee(k)=[];
                     break;
                 end
            end
            idc=1;
            break;
       end
   end
   
   if idc==0
       break;
   end
end

if size(ee, 2)<2
    return
end

ids = [ids, ee(1).id];
times=[times, ee(1).s];
times=[times, ee(1).e];
t = ee(1).e;
es = size(ee, 2);
ee=ee(2:es);     


for r= 1:size(edges, 2)
for k = 1:size(ee, 2)
    if ee(k).s==t
        ids = [ids, ee(k).id];
        times=[times, ee(k).e];
        t=ee(k).e;
        ee(k)=[];
        break
    elseif ee(k).e==t
        ids = [ids, ee(k).id];
        times=[times, ee(k).s];
        t=ee(k).s;
        ef = ee(1:k-1);
        el = ee(k+1:size(ee, 2));
        ee(k)=[];
        break
    end  
end

    for p=1:size(times, 2)-1
        if times(p)==t
            ids = ids(p:size(ids, 2));
            times = times(p:size(times, 2));
            indicator=1;
            return
        end
    end
    
end



return

end

