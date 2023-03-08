function plot_monomial(coefficients, space, lim)
    % Function used for plotting polynomial created with monomial basis
    [~, input_size] = size(coefficients);   
    ans = [];
    for i = space
        val = 0;
        for j = 1:input_size
            val = val + (coefficients(j) * (i^(j-1)));
        end
        ans = [ans, val];
    end
    disp(ans)
    plot(space, ans, "red")
    ylim(lim)
end

