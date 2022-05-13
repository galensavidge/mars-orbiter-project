function q = quest_method(inertial_vectors, body_vectors, weights)
% Body and inertial vectors should be (3xN) matrices of column vectors. 
% Weights is a (1xN) vector of scalars. Outputs a CRP.

B = zeros(3);
for i = 1:length(weights)
    B = B + weights(i)*body_vectors(:,i)*(inertial_vectors(:,i)');
end

S = B + B';
rho = trace(B);
Z = [B(2,3) - B(3,2); B(3,1) - B(1,3); B(1,2) - B(2,1)];

K = [rho, Z';
     Z, S - rho*eye(3)];

% Initial guess
lambda_max = sum(weights)

% Iterate to find true eigenvalue
lambda_max = fzero(@(x)(det(K - x*eye(4))), lambda_max)

% Solve for CRP
q = ((lambda_max + rho)*eye(3) - S)\Z;