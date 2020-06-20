function invframe = invframe(X_buff0, overlap, L)

reverseBuffer = zeros(L,1);

for jj=1:size(X_buff0,2)
    vector = X_buff0(:,jj);
    vector(1:overlap) = []; % remove overlapping (or it is zero padding of first frame)
    reverseBuffer = [reverseBuffer; vector];
end
invframe = reverseBuffer;
invframe(L+1:end) = []; 
end