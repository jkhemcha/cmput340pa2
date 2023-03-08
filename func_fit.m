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
            coefficient_vector = (basis_mat \ Y');
        % Trig
        elseif basis == "trig"
            basis_mat = ones(input_size, 1);
            % Cos
            for i = 1:floor((input_size - 1) / 2)
                basis_mat = [basis_mat, cos(i*X')];
            end
            % Sin
            for i = 1:floor((input_size - 1) / 2)
                basis_mat = [basis_mat, sin(i * X')];
            end 
            [~, basis_mat_size] = size(basis_mat);
            if basis_mat_size < input_size
               % Sin once more for even case
               i = floor((input_size - 1) / 2) + 1
               basis_mat = [basis_mat, sin(i * X')];
            end
            disp(basis_mat)
            disp(Y')
            coefficient_vector = (basis_mat \ Y');
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
            %coefficient_vector = (basis_mat \ Y');
            coefficient_vector = (basis_mat' * basis_mat) \ (basis_mat' * Y');
        elseif basis == "trig"
            basis_mat = ones(input_size, 1);
            % Cos
            for i = 1:floor((parameters - 1) / 2)
                %disp(basis_mat)
                %disp(X')
                %disp(i)
                basis_mat = [basis_mat, cos(i*X')];
            end
            % Sin
            for i = 1:floor((parameters - 1) / 2)
                basis_mat = [basis_mat, sin(i * X')];
            end 
            [~, basis_mat_size] = size(basis_mat);
            if basis_mat_size < parameters
               % Sin once more for even case
               i = floor((parameters - 1) / 2) + 1
               basis_mat = [basis_mat, sin(i * X')];
            end
            %disp(basis_mat)
            % Solve normal equations
            coefficient_vector = (basis_mat' * basis_mat) \ (basis_mat' * Y');
        end
    end
       
end


