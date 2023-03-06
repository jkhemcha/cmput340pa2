function [coefficient_vector] = func_fit(X,Y,type,basis,parameters)
    % Input
    % X - input data (t)
    % Y - output data (y)
    % type - ("interpolation", "approximation")
    %    "interpolation" - Generate interpolating polynomial for data
    %    "approximation" - Generate approximate polynomial for data
    % basis - ("newton", "monomial")
    %    "poly" - Newton polynomial interpolation
    %    "trig" - Trig interpolation
    % parameters - Number of parameters to approximate when 'approximate' is selected
    %
    % Output
    % [coefficient_vector] vector of coefficients for approximate or interpolating polynomial
    
    [~, input_size] = size(X)
    
    % Handle both poly and trig interpolation
    if type == "interpolation"
        % Poly
        if basis == "poly"
            basis_mat = ones(input_size, 1)
            for i = 1:input_size - 1
                col = []
                for k = 1:input_size
                    col = [col, (X(k) - X(i)) * basis_mat(k,i)]
                end
                basis_mat = [basis_mat, col']
            end
        
        % Trig
        elseif basis == "trig"
            % TODO
        end
        coefficient_vector = (basis_mat \ Y');
    
    % Handle both poly and trig approximation
    elseif type == "approximation"
        % Poly
        if basis == "poly"
            % TODO
        elseif basis == "trig"
            % TODO
        end
    end
       
end


