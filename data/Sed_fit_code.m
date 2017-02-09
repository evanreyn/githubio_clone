count_3=0;
count=0;

% Create array for Indian Ocean Basin's (#3) thickness (STW13) and Age (MAge000) data, cutting off at
% Age = 150Ma.

for i =1:6485401;
if OceanBasinCode(i) == 3 && isnan(MAge000(i)) == 0 && isnan(STW13(i))==0 && MAge000(i) <= 150;
count_3=count_3+1;
end
end
 
Sed3=zeros(count_3,2);

% Add data to array and normalize by basin area (BasinAreas are the
% average grid box area for each basin, calculated with AREA gridded data.
% Please contact Evan - evanreyn@gmail.com - for full AREA data).
 
for i =1:6485401;
if OceanBasinCode(i) == 3 && isnan(MAge000(i)) == 0 && isnan(STW13(i))==0 && MAge000(i) <= 150;
count=count+1;
Sed3(count,1)= ((STW13(i))./1000).*AREA(i);
Sed3(count,2)= MAge000(i);
end
end

Sed3(:,1) = (Sed3(:,1)./(BasinAreas(1,2))).*1000;

% After binning thickness data with bins.m, fit binned data to polynomials
% with polyfit function.

Sedfit3_3 = polyfit(Sed3bins(:,2),Sed3bins(:,1),3);
Sedfit3_2 = polyfit(Sed3bins(:,2),Sed3bins(:,1),2);
Sedfit3_1 = polyfit(Sed3bins(:,2),Sed3bins(:,1),1);


