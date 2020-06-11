function emph_data = preEmphasis(data)
    P = [1 -0.95];
    emph_data = filter(P,1,data);
    
    