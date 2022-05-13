function B = davenport_q_method(body_vectors, inertial_vectors, weights)
% Body and inertial vectors should be (3xN) matrices of column vectors. 
% Weights is a (1xN) vector of scalars. Outputs a quaternion.

B = zeros(3);
for i = 1:length(weights)
    B = B + weights(i)*body_vectors(:,i)*(inertial_vectors(:,i)');
end

S = B + B';
rho = trace(B);
Z = [B(2,3) - B(3,2); B(3,1) - B(1,3); B(1,2) - B(2,1)];

K = [rho, Z';
     Z, S - rho*eye(3)];

% Find eigenvectors and eigenvalues of K
[V, L] = eig(K);

% Get the eigenvector corresponding to the largest eigenvalue
L = diag(L);
[~, max_ind] = max(L);

B = V(:,max_ind);
B = B/norm(B);