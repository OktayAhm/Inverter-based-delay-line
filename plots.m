%% Delay results for each bit

filename = '/home/oahmadli/E3560/simulations/testbench_low_power/spectre/schematic/netlist/delays_LYT.csv'; 

% Read the CSV file
data = readtable(filename, 'ReadVariableNames', false);

% Convert table to an array and transpose it to get a row vector
delays = table2array(data)';

% Remove NaN values
delays = delays(~isnan(delays));

% Convert delays from seconds to nanoseconds
delays = delays * 1e9;

% Separate into rising and falling delays
rising_delays = delays(1:2:end);  % Odd indices
falling_delays = delays(2:2:end); % Even indices

% Prepare the digital control code vector
control_code = 0:127;

% Plot the results
figure;
plot(control_code, rising_delays, 'b-', control_code, falling_delays, 'r-');
title('Delay vs. Control Code for Layout (Low Power)');
xlabel('Control Code');
ylabel('Delay (ns)');
legend('Rising Edge Delay', 'Falling Edge Delay');
grid on;


%% INL and DNL

% Calculate the ideal delay step
ideal_step_size = (rising_delays(end) - rising_delays(1)) / (length(rising_delays) - 1);

% Calculate DNL (Difference between actual steps and ideal step)
actual_steps = diff(rising_delays);
DNL = actual_steps - ideal_step_size;

% Initialize INL array with the same size as DNL
INL = zeros(size(DNL));

% Calculate INL using the cumulative sum method
INL(1) = DNL(1);  % Start from the first code, which often might be zero if not it starts from DNL(1)
for i = 2:length(DNL)
    INL(i) = INL(i-1) + DNL(i);
end

% Adjust DNL and INL to start from zero for better visualization
DNL = [0, DNL];  % Add zero to begining to align with control codes
INL = [0, INL];  % Add zero to begining to align with control codes

% Convert DNL and INL from time to LSBs
DNL_LSB = DNL / ideal_step_size;
INL_LSB = INL / ideal_step_size;

% Plot DNL and INL in LSBs
figure;
subplot(2, 1, 1); % Subplot for DNL
stem(control_code, DNL_LSB, 'filled');
title('Differential Nonlinearity (DNL) for Layout (Low Power)');
xlabel('Control Code');
ylabel('DNL (LSBs)');
grid on;

subplot(2, 1, 2); % Subplot for INL
stem(control_code, INL_LSB, 'filled');
title('Integral Nonlinearity (INL) for Layout (Low Power) ');
xlabel('Control Code');
ylabel('INL (LSBs)');
grid on;

%% Average Power

% File path for power data
filename_power = '/home/oahmadli/E3560/simulations/testbench_low_power/spectre/schematic/netlist/powers_LYT.csv';

% Read the power CSV file
data_power = readtable(filename_power, 'ReadVariableNames', false);

% Convert table to array and transpose to get a row vector
power = table2array(data_power)';

% Remove NaN values from power data
power = power(~isnan(power));

% Convert power from Watts to microwatts
power = power * 1e6;

% Plot VDD Power for each code
figure;
stem(control_code, power, 'filled');
title('VDD Power for Each Control Code');
xlabel('Control Code');
ylabel('Power (uW)');
grid on;
