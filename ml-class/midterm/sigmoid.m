function g = sigmoid(z)
% This function computes the sigmoid of z.
% as it is for classification problem.

g = 1.0 ./ (1.0 + exp(-z));
end
