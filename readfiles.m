prod = readtable('/Users/mac/Downloads/production.csv');
prod2 = table2timetable(prod);
TT = synchronize(prod2,'hourly','sum');
lpEnergy = table2array(TT(:,4))+table2array(TT(:,5))+table2array(TT(:,6));



hlpEnergy = zeros(24,1);
for i=1:24
    lpene = lpEnergy(i:24:end,:);
    hlpEnergy(i) = nanmean(lpene);
    costpm = 100./hlpEnergy;
end


    

%{
csmpt = readtable('/Users/mac/Downloads/power_samples_d1_1.csv');
csmpt2 = table2timetable(csmpt);
csmpt2 = csmpt2(:,11);
csmpt3 = csmpt2(table2array(csmpt2(:,1))>100,:);
csmpt4 = synchronize(csmpt2,'minutely','sum');
csmpt5 = csmpt4(randperm(size(csmpt4, 1)),:);
csmpt6 = timetable2table(csmpt5);
datetime.setDefaultFormats('default','dd-MM-yyyy hh:mm:ss');
csmptTime = table2array(csmpt6(:,1));
csmptTime.Format  = 'default';
csmptTime = datevec(csmptTime);
csmptTimeH = csmptTime(:,4);
consumption = [csmptTimeH table2array(csmpt6(:,2))/1000];



%}



