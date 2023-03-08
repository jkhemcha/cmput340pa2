function plot_trig(coefficients, space, lim, color)
    % Function used for plotting polynomial created with monomial basis
    [input_size, ~] = size(coefficients);   
    K = floor((input_size-1)/2);
    ans = [];
    for i = space
        val = 0;
        for j = 1:K
            val = val + (coefficients(j+1) * (cos(j * i)));
        end
        for j = 1:K
            val = val + (coefficients(j+K+1) * (sin(j * i)));
        end
        ans = [ans, val];
    end
    plot(space, ans, color)
    ylim(lim);
end

