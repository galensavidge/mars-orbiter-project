function q = olae_method(inertial_vectors, body_vectors, weights)
% Body and inertial vectors should be (3xN) matrices of column vectors. 
% Weights is a (1xN) vector of scalars. Outputs a CRP.

% Put together d, S, and W matrices
N = length(weights);
D = zeros(3*N, 1);
S = zeros(3*N, 3);
W = zeros(3*N);

for i = 1:N
    start = 3*(i - 1) + 1;
    stop = 3*i;
    Bi = body_vectors(:,i);
    Ni = inertial_vectors(:,i);
    D(start:stop,:) = Bi - Ni;
    S(start:stop,:) = skew_sym(Bi + Ni);
    W(start:stop,start:stop) = weights(i)*eye(3);
end

% Use pseudo-inverse (weighted least squares) to solve for CRP
q = (S'*W*S)\(S')*W*D;