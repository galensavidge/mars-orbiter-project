function sigma_sum = MRP_sum(sigma1, sigma2)

s1 = sum(sigma1.^2);
s2 = sum(sigma2.^2);
sigma_sum = ((1 - s1)*sigma2 + (1 - s2)*sigma1 - 2*cross(sigma2, sigma1))...
    /(1 + s1*s2 - 2*dot(sigma1, sigma2));