function bdot = mrp_diff_eq(sigma, w)
% MRP kinematic differential equation

r = norm(sigma);
ss = skew_sym(sigma);
B = (1 - r^2)*eye(3) + 2*ss + 2*(sigma*sigma');
bdot = 0.25*B*w;