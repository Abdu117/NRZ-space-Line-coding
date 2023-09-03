%--------------------------Get NRZ-S--------------------------
%Clear Command Window
clc
% Binary data sequence
input = [1 0 0 1 1 1 0 1];

% NRZ-I encoding
nrz_i_encoded = 2 * input - 1; % Convert binary 0 to -1, binary 1 to +1

% NRZ-I signal
nrz_i_signal = [];

% Set initial level
level = 1; % Assume starting with a high level
for i = 1:length(nrz_i_encoded)
    if nrz_i_encoded(i) == 1 % If binary 1
        nrz_i_signal = [nrz_i_signal , level*ones(1, 100)]; % Maintain the current level for 10 samples
    else % If binary 0
        level = -level; % Invert the level
        nrz_i_signal = [nrz_i_signal , level*ones(1, 100)]; % Set the new level for 10 samples
    end
end

% Create time vector for the signal
t = 0:0.01:length(nrz_i_signal)*0.01-0.01;

% Plot the NRZ-I signal
figure;
plot(t, nrz_i_signal, 'LineWidth', 2);
xlabel('Time');
ylabel('Amplitude');
title('NRZ-I Line Coding');
axis([0  , length(nrz_i_signal)*0.01-0.01 , -1.5 , 1.5]);
grid on;

%--------------------------Get the orignal code back--------------------------

data = [1 -1 1 1 1 1 -1 -1]; % Input vector NRZ-S
output = []; % Initialize the output vector
output = [output , 1*ones(1,100)];
% Compare current element with previous element
for i = 2:length(data)
    if data(i) == data(i-1)
        output = [output , 1*ones(1,100)]; % Set output to 1 if equal
    else 
        output = [output , 0*ones(1,100)];
    end
end

% Create time vector for the signal
t = 0:0.01:length(output)*0.01-0.01;

% Plot the NRZ-I signal
figure;
plot(t, output, 'LineWidth', 2);
xlabel('Time');
ylabel('Amplitude');
title('NRZ-I Line Decoding');
axis([0  , length(output)*0.01-0.01 , -1.5 , 1.5]);
grid on;