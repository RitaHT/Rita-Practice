function p = nnPredict(Theta1, Theta2, X)
% This function predicts the survival of the people, represented in inputX,
%   given a trained neural network (Theta1, Theta2).
% Returned value:
%   p: the predictions of the m examples in X. (m*1)

% Useful values
m = size(X, 1);
num_outputs = 2; % deforted here

% initializing return value p
p = zeros(m, 1);

% First layer to Second layer
b2 = sigmoid([ones(m, 1) X] * Theta1);     % (m*(6+1)) * ((6+1)*4) = m*4
% Second layer to Output layer
b3 = sigmoid([ones(m, 1) b2] * Theta2);    % (m*(4+1)) * ((4+1)*2) = m*2

% p (m*1): returns the column position,
%   (col1 or col2) of the max in each row of b3.
%   If p=1, means the chance of survived is dominant.
%   If p=2, means the chance of survived is dominant.
% dummy: the max in each row of b3. (not all ones, but the max)
[dummy, p] = max(b3, [], 2);

for i = 1:m
    if p(i) == 2
        p(i) = 0; % change only the not survived (col2)
    end
end

% =========================================================================


end
