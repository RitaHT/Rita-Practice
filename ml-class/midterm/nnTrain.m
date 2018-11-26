% Machine Learning Class Midterm Project: Titanics
%
% Teacher: J Li
% Name: Rita Tan Shiqin
% DDL: Nov.25,2018 (this Sunday night)

%% In here, I am trying Neural Network for solving the problem
%  in simple (theta)transpose * X. and h(theta)(x)= g(z)

%% ====== 1. Load and Process Data ======

    %% First, load processed data X
    load('processedData.mat'); % it is called X.

    %% Now process the data y, make it to m*2 matrix for comparing for h(theta)
    % the 1st column means survived, 2nd column means NOT survived.
    fid = fopen('train.csv');
    y = textscan(fid, '%*f %f %*f %*q %*s %*f %*f %*f %*s %*f %*s %*s', 'HeaderLines',1,'Delimiter',',');
    fclose(fid);
    y = cell2mat(y);
    y = [y(:), zeros(size(y,1),1)];
    for i = 1:size(y,1)
        if y(i,1) == 0  % first column is survived
            y(i,2) = 1; % second column is not survived
        end
    end

%% ====== 2. Setting up the Neural Network ======
% First, set the number of units of each layers
input_layer_size = 5;
hidden_layer_size = 4;
num_of_outputs = 2;     % I seem to defort it in the nnCostFunc.m

% Second, initialize the parameter theta(forward) & delta(backward).
init_epsilon = 10^-4;
% all elements are different
% leave Delta inside nnCostFunc.m
Theta1 = rand(6,4) * (2 * init_epsilon) - init_epsilon;
Theta2 = rand(5,2) * (2 * init_epsilon) - init_epsilon;

% put Theta1 and Theta2 together in nn_Thetas,
% as the fminunc can only return one value
nn_Thetas = [Theta1(:) ; Theta2(:)]; % (28+10)*1


    %% Now, Do Gradient Checking to make sure there is no bug.
    % should turn off before doing the test
    % I actually still not sure how this works
    nnCheckGradients; % assume lambda = 0

    lambda = 3;       % for regularizing
    nnCheckGradients(lambda);
%% ====== 3. Train the Neural Network ======
% For each example in training set X,
% perform Forward & Backward propagation.
% nnCostFunc() returns regularized J and gradient for Theta1 & Theta2.
%
% Then, use fminunc() to find the optimal nn_Thetas,
% which correspond to the minimal cost function value J.


    % Create a 'short hand' for minimizing cost function
    % @(p) stands for the nn_Thetas,
    %   which is the expected output of fminunc().
    % costFunc stands for the rest of the parameters,
    %   to avoid the fminunc() takes too much space to read easily
    costFunc= @(p) nnCostFunc(p, ...
                              input_layer_size, ...
                              hidden_layer_size, ...
                              num_of_outputs, X, y, lambda);

    % This is the option short cut for fminunc()
    options = optimset('MaxIter', 50);

    % Now, costFunc() works as a function that only take in 1 argument:
    %   the nn_Thetas.
    % fminunc() returns the optimal nn_Thetas (34*1).
    [nn_Thetas, cost] = fminunc(costFunc, nn_Thetas, options);


    %% Last, output the nn_Thetas for nnTest.m to use
    save('nnWeights', 'nn_Thetas');


%% So far the end. For testing, see nnTest.m
