area_analytical = 4 / 3;

a = 1;
r = 1 / 4;

all_vals = [];
for k = 1:20
    all_vals(k) = a * sum(r .^ ((1:k) - 1));
end

figure;
scatter(1:20, all_vals)
hold on
plot(linspace(1, 20, 200), area_analytical * ones(1, 200))
xlabel("k")
ylabel("Sum")
title("Sum vs. k")