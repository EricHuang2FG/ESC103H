
area_analytical = 1 / (1 - 1 / 4)

% partial_sum = (1 / 4) .^ (0:1:19)
partial_sum = (((1 / 4) .^ (1:20)) - 1) ./ (((1 / 4) - 1))

plot(1:20, partial_sum, ".")
hold on

yline(area_analytical, "-r")

legend("Partial Sum of Archimedes' Geometric Series", "Analytical Area")

legend("Position", [0.37202,0.51389,0.52143,0.082143])

xlabel("k")
ylabel("Area")