% This script will be used for question 2 of the assignment

% Green line = approximation
% Red line = interpolation

% PROBLEM A
T = [ 0.  1.  2.  3.  4.  5.  6.  7.  8.  9. 10.];
D = [486.   481.14 466.56 442.26 408.24 364.5  311.04 247.86 174.96  92.34 0.  ];

% Display data in scatterplot
fig1 = figure();
scatter(T, D, "blue")

% Solve for the coefficients of the interpolation polynomial
[basis_mat_A, coefficient_vector_A] = func_fit(T, D, "interpolate", "poly", 0);

% Plot the interploation polynomial over the scatterplot
figure(fig1)
hold on
scatter(T, D, "blue")
plot_monomial(coefficient_vector_A, T, [0,500], "red")
hold off

% I chose to use interpolation for this dataset since after getting the
% scatterplot the data did not seem to have any outliers or points that did
% did not follow what you would expect given the nature of the physics
% problem.

% Calculate residuals
residuals_A = abs(D' - (basis_mat_A * coefficient_vector_A))
relative_residuals_A = residuals_A ./ abs(D')

% Based on the above residuals, we can see that the errors from my model relatively
% small when compared with the dataset as well as what we would expect from
% the physics experiment.
% Therefore, the model seems to be a good representation of reality.

% PROBLEM B.

% Load in the dataset into variables 'x' and 'y'
load("pa2q2b.mat");

fig2 = figure();
scatter(x, y, "blue")

% Solve for the coefficients of the approximate polynomial
[basis_mat_B, coefficient_vector_B] = func_fit(x, y, "approximate", "poly", 3);

% Plot the approximate polynomial over the scatterplot
figure(fig2)
hold on
scatter(x, y, "blue")
plot_monomial(coefficient_vector_B, x, [-5,60], "green")
hold off

% Calculate residuals
residuals_B = abs(y' - (basis_mat_B * coefficient_vector_B))
relative_residuals_B = residuals_B ./ abs(y')

% Based on the above residuals, we can see that the errors from my model are relatively
% small when compared with the original values of the dataset, meaning the model is quite good.

% The equation I got by solving for the coefficients was:
% -0.1330 + 0.0067t + 1.0114t^2
% This results in the derivative with respect to 't' of: 
% 1.0114t + 0.0067
% and the area under the curve being the definite integral from 
% t=-5 to t=5 of the above polynomial which when solved equals:
% approximetely 84.28331

% I chose to use approximation for this dataset since there were so many
% data points and using the monomial basis function, the higher degree of
% polynomial we have to interpolate becomes more and more ill-conditioned.
% Additionally, there are small deviations between individual points in the
% dataset which resulted in the curve being very 'choppy' aned not smooth.
% Using an approximate polynomial with 3 parameters resulted in a
% much smoother plot that represented the data better.





