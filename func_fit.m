function [coefficient_vector] = func_fit(X,Y,type,basis,parameters)
    % Input
    % X - input data (t)
    % Y - output data (y)
    % type - ("interpolate", "approximate")
    %    "interpolation" - Generate interpolating polynomial for data
    %    "approximation" - Generate approximate polynomial for data
    % basis - ("poly", "trig")
    %    "poly" - Newton polynomial interpolation
    %    "trig" - Trig interpolation
    % parameters - Number of parameters to approximate when 'approximate' is selected
    %
    % Output
    % [coefficient_vector] vector of coefficients for approximate or interpolating polynomial
    
    [~, input_size] = size(X);

    % Handle both poly and trig interpolation
    if type == "interpolate"
        % Poly
        if basis == "poly"
            basis_mat = [];
            for i = 1:input_size
                basis_mat = [basis_mat, X'.^(i-1)];
            end
            %basis_mat = ones(input_size, 1)
            %for i = 1:input_size - 1
            %    col = []
            %    for k = 1:input_size
            %        col = [col, (X(k) - X(i)) * basis_mat(k,i)]
            %    end
            %    basis_mat = [basis_mat, col']
            %end
            coefficient_vector = (basis_mat \ Y');
        % Trig
        elseif basis == "trig"
            % TODO
        end
    
    % Handle both poly and trig approximation
    elseif type == "approximate"
        % Poly
        if basis == "poly"
            basis_mat = [];
            for i = 1:parameters
                basis_mat = [basis_mat, X'.^(i-1)];
            end
            % Solve normal equations
            coefficient_vector = (basis_mat' * basis_mat) \ (basis_mat' * Y');
        elseif basis == "trig"
            % TODO
        end
    end
       
end


