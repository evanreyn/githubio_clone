function binarr = bins (data, numberBins)
% , ttl, xlabel, ylabel)

xdata = data(:,2);
ydata = data(:,1);
binarr = zeros(numberBins,7);
binSize = (max(xdata) - min(xdata))/numberBins;


for i = 1:numberBins;
    
    count = 0;
    
    for j = 1:length(ydata);
        if xdata(j) < binSize*i && xdata(j) >= binSize*(i-1);
            count = count+1;
        end
    end
        
        currentbin = zeros(count,1);
        count=0;
        
     for j = 1:length(ydata);   
        if xdata(j) < binSize*i && xdata(j) >= binSize*(i-1);
            count=count+1;
            currentbin(count)= ydata(j);
        end
    end
    
    binarr(i,1) = binSize/2 + binSize*(i-1);
    binarr(i,2) = mean(currentbin);
    binarr(i,3) = std(currentbin);
    binarr(i,4) = count;
    binarr(i,5) = binarr(i,3)/sqrt(count);
    binarr(i,6) = prctile(currentbin,25);
    binarr(i,7) = prctile(currentbin,75);
end

            
