function [M1,M2]= dynamicThres(feature,bin)

%histogram 
[n,edge] = histcounts(feature,bin);

%Get local maxima or local minima
[localMax,ste_index] = findpeaks(n);
[i,j] = max (n);
[k,l] = min(n);

%set first and second local maxima
switch(length(localMax))
    case(0)
        M1 = edge_ste(j);
        M2 = edge_ste(l); %zero would work fine too
        
    case(1)
        M1 = (1/2)*(edge(ste_index(1))+edge(ste_index(1)+1));
        M2 = edge_ste(l); %zero would work fine too
        
    otherwise
        M1 = (1/2)*(edge(ste_index(1))+edge(ste_index(1)+1));
        M2 = (1/2)*(edge(ste_index(2))+edge(ste_index(2)+1));
end     
    
