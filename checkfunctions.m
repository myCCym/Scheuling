
%dataset is a 4 tuples
%start time, end time, disconnect time, total energy.
%this function returns an window and duration.
dataset = output;
num = size(dataset, 1);
for i=1:num
 
    %st <= et <=dt 
    if ~(dataset(i,1)<=dataset(i,3) && dataset(i,3)<=dataset(i,2))
            dataset(i,1)<=dataset(i,3) 
            dataset(i,3)<=dataset(i,2)
    end


end
