function g = sigmoidGrad(z)

%   This function computes the gradient of the sigmoid function. 
%   Returned value:
%      z is a matrix or a vector or a scalar,
%      should return the gradient for each element.

g = zeros(size(z)); % m*4 for z2
g = sigmoid(z) .* (1 - sigmoid(z)); % even though I don't know how this was worked out.


end