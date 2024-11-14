load lawdata.mat

scatter(gpa, lsat, ".")
hold on

m = 15

% Linear fit

y = lsat
A = [ones(15, 1), gpa]

Astar = A' * A
ystar = A' * y

c = Astar \ ystar

x_coords = gpa
y_coords = c(2) * x_coords + c(1)

err_vec_linear = y - A * c
mean_square_err_linear = (1 / m) * (dot(err_vec_linear, err_vec_linear))

plot(x_coords, y_coords, "-")

% Quadratic fit

A = [ones(15, 1), gpa, gpa .^2]

Astar = A' * A
ystar = A' * y

c = Astar \ ystar

x_coords = linspace(2.7, 3.5, 1000)
coefficients = flip(c)
y_coords = polyval(coefficients, x_coords)

err_vec_quadratic = y - A * c
mean_square_err_quadratic = (1 / m) * (dot(err_vec_quadratic, err_vec_quadratic))

plot(x_coords, y_coords, "-")

% cubic fit

A = [ones(15, 1), gpa, gpa .^ 2, gpa .^ 3]

Astar = A' * A
ystar = A' * y

c = Astar \ ystar

coefficients = flip(c)
y_coords = polyval(coefficients, x_coords)

err_vec_cubic = y - A * c
mean_square_err_cubic = (1 / m) * (dot(err_vec_cubic, err_vec_cubic))

plot(x_coords, y_coords, "-")

legend("Data points", "Linear fit", "Quadratic fit", "Cubic fit")
xlabel("GPA")
ylabel("LSAT Score")

disp(mean_square_err_linear)
disp(mean_square_err_quadratic)
disp(mean_square_err_cubic)

%% 
% Lowest MSE was given by the cubic model. This is because it has more "turns" 
% and so it is able to get closer to more data points compared to quadratic or 
% linear models. I would not recommend using this fit however, since the relationship 
% between LSAT score and GPA doesn't make sense to be a cubic.