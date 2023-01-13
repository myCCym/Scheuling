addpath('/Users/mac/Downloads/iso2mesh-1.9.6');
jsondata  = loadjson('/Users/mac/Downloads/acndata_sessions (2).json');
[~,num] = size(jsondata.x0x5F_items);
output = zeros(num, 4);
for i=1:num
    data = jsondata.x0x5F_items(i);
    data = data{1,1};
    
    %avaiable window
    output(i,1) = str2num(data.connectionTime(18:19));
    output(i,2) = str2num(data.disconnectTime(18:19));
    %duration
    [~,sl] = size(data.doneChargingTime);
    if sl<=20
        continue
    end
    output(i,3) = str2num(data.doneChargingTime(18:19));
    %MWh
    output(i,4) = data.kWhDelivered;

end
output(all(output==0,2),:) = [];
output(all(output(:,4)==0,2),:) = [];
output(all(output(:,1)>output(:,3),2),:) = [];
output(all(output(:,3)>output(:,2),2),:) = [];