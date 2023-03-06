function [coefficient_vector] = func_fit(X,Y,type,basis,parameters)
    % Input
    % X - input data (t)
    % Y - output data (y)
    % type - ("interpolation", "approximation")
    %    "interpolation" - Generate interpolating polynomial for data
    %    "approximation" - Generate approximate polynomial for data
    % basis - ("newton", "monomial")
    %    "newton" - Newton polynomial interpolation
    %    "monomial" - Monomial polynomial interpolation
    % parameters - Number of parameters to approximate when 'approximate' is selected
    %
    % Output
    % [coefficient_vector] vector of coefficients for approximate or interpolating polynomial
    [~, input_size] = size(X)
    if type == "interpolation"
        if basis == "monomial"
            % Create matrix for basis functions
            basis_mat = []
            for i = 1:input_size
                basis_mat = [basis_mat, X'.^(i-1)];
            end
        elseif basis == "newton"
            basis_mat = ones(input_size, 1)
            for i = 1:input_size - 1
                col = []
                for k = 1:input_size
                    col = [col, (X(k) - X(i)) * basis_mat(k,i)]
                end
                basis_mat = [basis_mat, col']
            end
        end
        coefficient_vector = (basis_mat \ Y');
    elseif type == "approximation"
        
    end
       
end


