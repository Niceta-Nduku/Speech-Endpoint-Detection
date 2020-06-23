[data,fs] = audioread('sf2_filtered.wav');

t = [0 : 1/fs : length(data)/fs]; % time in sec
t = t(1:end - 1);
%remove dc component
data = data - mean(data);

%normalize data 
data = data / abs(max(data));

%get upper envelope

[U,L] = envelope(data);
plot(U)

%set max peak
m = mean(U)
mph = mean(U)/3

% find the peaks
[pks,ind] = findpeaks(U, 'MinPeakHeight', mph);

data_p = zeros(length(data),1);
data_p (ind) = 1;
figure;

plot(t, data_p, '-')

j = 0;
for i = length(data_p)
    if data_p(i) == 1
        data_p(i) = pks(j);
    end
     j = j + 1;

end


figure;
plot(U) ; hold on;
plot(data_p,'m','LineWidth',1);
