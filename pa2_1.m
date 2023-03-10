X1 = [-6.28318531 -4.96040945 -3.6376336   -2.31485774 -0.99208189  0.33069396   1.65346982   2.97624567  4.29902153   5.62179738];
Y1 = [-0.02212373  0.93174316  0.44657927  -0.71237743 -0.87719887  0.35844402   0.95673157   0.15797694 -0.92443154  -0.65275084];
X2 = [-5.         -4.79591837 -4.59183673 -4.3877551  -4.18367347 -3.97959184  -3.7755102  -3.57142857 -3.36734694 -3.16326531 -2.95918367 -2.75510204  -2.55102041 -2.34693878 -2.14285714 -1.93877551 -1.73469388 -1.53061224  -1.32653061 -1.12244898 -0.91836735 -0.71428571 -0.51020408 -0.30612245  -0.10204082  0.10204082  0.30612245  0.51020408  0.71428571  0.91836735   1.12244898  1.32653061  1.53061224  1.73469388  1.93877551  2.14285714   2.34693878  2.55102041  2.75510204  2.95918367  3.16326531  3.36734694   3.57142857  3.7755102   3.97959184  4.18367347  4.3877551   4.59183673   4.79591837  5.        ];
Y2 = [ 1.51657986e+01  1.18834486e+01  1.14908377e+01  9.69999012e+00   8.83752995e+00  8.53654378e+00  7.26220222e+00  6.24526603e+00   6.14466521e+00  2.20438691e+00  3.02257790e+00  2.55301601e+00   1.20314417e+00  2.81993279e+00 -7.95772374e-02  5.17986596e-01  -2.02214422e+00 -1.88483645e+00 -6.00919079e-01 -1.89204707e-01   1.69449681e-02  3.91334228e-01 -1.73970249e+00 -3.19757434e-01  -6.00188224e-01  2.31330343e-01  5.82638717e-01  4.22184971e+00   3.59292410e-01  4.59202652e+00  4.71769806e+00  5.21676309e+00   6.70631069e+00  6.62448237e+00  7.35495405e+00  9.65171985e+00   9.61038903e+00  1.22648215e+01  1.29301284e+01  1.33289427e+01   1.76286428e+01  1.76382160e+01  2.07450785e+01  2.18295969e+01   2.30767522e+01  2.64519126e+01  2.74412541e+01  2.89516763e+01   3.31531920e+01  3.70987315e+01];

% 1-1
% Display scatterplots of the data in two figures
fig1 = figure();
scatter(X1, Y1)
fig2 = figure();
scatter(X2, Y2)

% 1-2
% For dataset 1 (X1, Y1), the Trig basis function seems appropriate
% since the distribution of data seems to follow a repeating / sinusodal
% pattern, and all the Y values are between -1 and 1.

% For dataset 2 (X2, Y2), the Polynomial basis function is appropriate since
% the distribution of data seems to follow more of a polynomial function
% (parabola) and is not showing patterns of repetition.

% 1-3
% For dataset 1, we should use interpolation since the scatterplot shows
% that the data follows a clear sinusodal pattern with no clear outliers.
% making interpolation provide a smooth curve.

% For dataset 2, we should use approximation
% since there are many more data points, and small inconsistencies
% in the data points will result in the interpolating function
% overfitting. Since I am using the monomial basis
% function, we also want to avoid creating an interpolating polynomial
% with a very high degree, since it becomes more ill-conditioned.

% Interpolation
[basis_mat_X1_i, interpolation_coefficient_vector_X1] = func_fit(X1, Y1, "interpolate", "trig", 0);
[basis_mat_X2_i, interpolation_coefficient_vector_X2] = func_fit(X2, Y2, "interpolate", "poly", 0);

% Approximation
[basis_mat_X1_a, approximation_coefficient_vector_X1] = func_fit(X1, Y1, "approximate", "trig", 3);
[basis_mat_X2_a,approximation_coefficient_vector_X2] = func_fit(X2, Y2, "approximate", "poly", 5);

% Re-plot the figures with the lines over top.
% Green = approximation
% Red = interpolation
figure(fig1)
hold on
scatter(X1, Y1, "blue")
plot_trig(approximation_coefficient_vector_X1, linspace(-10, 10, 100), [-1, 1], "green")
plot_trig(interpolation_coefficient_vector_X1, linspace(-10, 10, 100), [-1, 1], "red")
hold off

figure(fig2);
hold on
scatter(X2, Y2, "blue")
plot_monomial(interpolation_coefficient_vector_X2, linspace(-5, 5, 100), [-5, 40], "red")
plot_monomial(approximation_coefficient_vector_X2, linspace(-5, 5, 100), [-5, 40], "green")
hold off
