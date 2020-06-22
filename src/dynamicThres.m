function Thres = dynamicThres(feature,bin,W)

medianFeature = medfilt1(feature, 5);
medianFeature = medfilt1(medianFeature, 5);

feature_mean = mean(medianFeature);

%histogram 
[n,edge] = histcounts(feature,bin);

%Get local maxima or local minima
[localMax,ste_index] = findMaxima(n, 3);

%set first and second local maxima
if(size(localMax,2)<2)
     Thres = feature_mean/2;
else 
    M1 = edge(localMax(1,1));
    M2 = edge(localMax(1,2));
    Thres = ((W*M1) + M2)/(W+1);    
end


