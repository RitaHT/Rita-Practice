function [J grad] = nnCostFunc(nn_Thetas, ...
                               input_layer_size, ...
                               hidden_layer_size, ...
                               num_of_outputs, X, y, lambda)
% This nnCostFunc implements the cost function 
% for a 3-layer neural network which performs classification.
%   Returned parameters: 
%   J: the regularized cost 
%   grad: the gradient for Theta1 and Theta2
%         (partial derivatives?) of the neural network

% useful values
m = size(X,1);
% X: m*5
% y: m*2

% separate Theta1 and Theta2 from nn_Thetas
% (5+1)*4
Theta1 = reshape(nn_Thetas(1:(input_layer_size + 1)*hidden_layer_size), ...
                    (input_layer_size + 1), hidden_layer_size);
% (4+1)*2
Theta2 = reshape(nn_Thetas((1 + (input_layer_size + 1)*hidden_layer_size):end), ...
                    (hidden_layer_size + 1), num_of_outputs);

%% 1. Forward Prop and get J

% First layer to Second layer
a1 = [ones(m,1) X];     % Add in the bias unit: m*7
z2 = a1 * Theta1;       % (m*7) * (7*4) = (m*4): there is 4 a2 element for each example 

% Second layer to Output layer
a2 = sigmoid(z2);       % m*4, As this is a classification problem
%n = size(a2,1);         % n = m, number of examples
a2 = [ones(m,1) a2];     % Add in the bias unit: m*5
z3 = a2 * Theta2;       % (m*5) * (5*2) = (m*2): there are 2 possible prediction for each example

% Output values: m*2
h = sigmoid(z3);        % Again, as this is a classification problem

% Calculate unregularized J
J = 1/m * sum(sum((-y).*log(h) - (1-y).*log(1-h)));

% returning regularizing J, not for bias terms
costRegTerm = lambda/(2*m) * (sum(sum(Theta1(:,2:end) .^2))...
                            + sum(sum(Theta2(:,2:end) .^2)) );
J = J + costRegTerm;
                        
%% 2. Backward Prop and get Delta and grad

% Random initialized Delta 
init_epsilon = 10^-4;       % same for Theta1 and Theta2
Delta1 = rand(6,4) * (2 * init_epsilon) - init_epsilon;
Delta2 = rand(5,2) * (2 * init_epsilon) - init_epsilon;

% Calculate small delta for each layer
delta3 = h - y;             % m*2: the difference in output

delta2 = delta3 * Theta2';   % (m*2) * (5*2)' = m*5, there are 5 a2 for each example.
delta2 = delta2(:, 2:end);   % m*4, Do not count in the bias term
delta2 = delta2 .* sigmoidGrad(z2); % As defined, but not really clear about this sigmoidGrad().
       
% There are 4 a2 and (6+1) x for each example,
% each row is the 4 a2 corresponding one of the x feature.
Delta1 = a1' * delta2;      % (m*7)' * (m*4) = 7*4
% There are 2 possible survival and (4+1) a2 for each example,
% each row is the 2 possibles corresponding one of the a2.
Delta2 = a2' * delta3;      % (m*5)' * (m*2) = 5*2

% Calculate the regularized gradient of the cost functions J() of both Theta1 and Theta2 
Theta1_grad = 1/m * Delta1 + lambda/m * Theta1; 
Theta2_grad = 1/m * Delta2 + lambda/m * Theta2; 
% remove the regularizing term for the bias terms (in Theta and Theta_grad)
Theta1_grad(:,1) = Theta1_grad(:,1) - lambda/m * Theta1(:,1); % 7*4
Theta2_grad(:,1) = Theta2_grad(:,1) - lambda/m * Theta2(:,1); % 5*2

% returning grad: the total Thetas
grad = [Theta1_grad(:); Theta2_grad(:)]; % (28+10)*1

