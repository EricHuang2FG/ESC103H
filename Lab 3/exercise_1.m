subplot(2, 1, 1)

x = linspace(0, 10, 100000)
y = sin(x)

plot(x, y)

subplot(2, 1, 2)

y = cos(x)

plot(x, y)

A = [0, -1; 1, 0]
T = 10
x0 = 1
y0 = 0

[t, x, y] = EMsolver(A, x0, y0, T, 100)
[t_1, x_1, y_1] = EMsolver(A, x0, y0, T, 1000)
[t_2, x_2, y_2] = EMsolver(A, x0, y0, T, 10000)

figure

subplot(2, 1, 1)
plot(t, x)
hold on
plot(t_1, x_1, "--")
plot(t_2, x_2, "-")
plot(t, cos(t), ":")
legend("N = 100", "N = 1000", "N = 10000", "Exact Solution")
title("Approximated Solution To Differential Equations Using Euler's Method")
xlabel("t")
ylabel("x(t)")
subplot(2, 1, 2)
plot(t, y)
hold on
plot(t_1, y_1, "--")
plot(t_2, y_2, "-")
plot(t, sin(t), ":")
legend("N = 100", "N = 1000", "N = 10000", "Exact Solution")
xlabel("t")
ylabel("y(t)")

[t, x, y] = IEMsolver(A, x0, y0, T, 100)
[t_1, x_1, y_1] = IEMsolver(A, x0, y0, T, 1000)
[t_2, x_2, y_2] = IEMsolver(A, x0, y0, T, 10000)
figure

subplot(2, 1, 1)
plot(t, x, DisplayName="N = 100")
hold on
legend()
plot(t_1, x_1, "--", DisplayName="N = 1000")
plot(t_2, x_2, "-", DisplayName="N = 10000")
plot(t, cos(t), ":", DisplayName="Exact Solution")
title("Approximated Solution To Differential Equations Using Improved Euler's Method")
xlabel("t")
ylabel("x(t)")
subplot(2, 1, 2)
plot(t, y, DisplayName="N = 100")
hold on
plot(t_1, y_1, "--", DisplayName="N = 1000")
plot(t_2, y_2, "-", DisplayName="N = 10000")
plot(t, sin(t), ":", DisplayName="Exact Solution")
legend("N = 100", "N = 1000", "N = 10000", "Exact Solution")
xlabel("t")
ylabel("y(t)")
%%
function [t, x, y] = IEMsolver(A, x_0, y_0, T, N)
    dt = T/N; 
    t = 0:dt:T;
    SOL = NaN(2,length(t)); 
    SOL(1,1) = x_0; 
    SOL(2,1) = y_0;
    for n = 2:length(t)
        SOL(:,n) = SOL(:,n-1) + dt*A*SOL(:,n-1); 
        SOL(:,n) = SOL(:,n-1) + (dt / 2)*(A*SOL(:,n-1) + A*SOL(:,n)); 
    end 
    x = SOL(1,:);
    y = SOL(2,:);
end