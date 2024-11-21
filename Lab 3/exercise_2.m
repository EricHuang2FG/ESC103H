k1 = 4.66
k2 = 4.66
m1 = 0.0917
m2 = 0.0765

A = [0 1 0 0; (-k1 - k2)/m1 0 k2/m1 0; 0 0 0 1; k2/m2 0 -k2/m2 0]
T = 10
Z0 = [100;0;50;0]

[t, x, x_prime, y, y_prime] = IEMsolver(A, Z0, T, 1000)
[t_1, x_1, x_prime_1, y_1, y_prime_1] = IEMsolver(A, Z0, T, 10000)

figure
subplot(2, 1, 1)
plot(t, x)
hold on
plot(t_1, x_1, "-")
legend("x, N = 1000", "x, N = 10000")
xlabel("Time")
ylabel("Displacement")
title("Amplitude vs. Time of a Spring")
subplot(2, 1, 2)
plot(t, y)
hold on
plot(t_1, y_1, "-")
legend("y, N = 1000", "y, N = 10000")
xlabel("Time")
ylabel("Displacement")
%%
function [t, x, x_prime, y, y_prime] = IEMsolver(A, Z0, T, N)
    dt = T/N; 
    t = 0:dt:T;
    SOL = NaN(4,length(t)); 
    SOL(:, 1) = Z0
    for n = 2:length(t)
        SOL(:,n) = SOL(:,n-1) + dt*A*SOL(:,n-1); 
        SOL(:,n) = SOL(:,n-1) + (dt / 2)*(A*SOL(:,n-1) + A*SOL(:,n)); 
    end 
    x = SOL(1,:);
    x_prime = SOL(2,:);
    y = SOL(3, :);
    y_prime = SOL(4, :);
end