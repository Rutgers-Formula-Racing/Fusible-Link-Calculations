nickel_thickness = 0.3; % Nickel thickness in mm
nickel_width_range = [0.75:0.5:2.75]; % Nickel width range in mm

onderdonk_seconds = @(I, A, t, Ta) log10((t/(234+Ta))+1)./((33.*((I)/A).^2));
I = [1:200]; % Range of currents we care about

figure
hold on;

for i = 1:size(nickel_width_range, 2)
    cmil = nickel_thickness * nickel_width_range(i) * 1973.53;
    time = onderdonk_seconds(I, cmil, 1455, 40);
    plot(I, time)
    legendInfo{i} = sprintf("%.2f mm", nickel_width_range(i)); 
end

xline(20);
xline(80);

ylim([0 120]) % Only want to see up to 2 minutes
title("Fusible Links Width (0.3mm thickness)");xlabel("Current (A)");ylabel("Time (s)");
legend(legendInfo)
hold off;
