function rho = DCM2MRP(C)

z = sqrt(trace(C) + 1);
if z ~= 0
    rho = [C(2,3) - C(3,2); C(3,1) - C(1,3); C(1,2) - C(2,1)]/(z*(z+2));
else
    B = DCM2quaternion(C);
    rho = B(2:4)/(1 + B(1));
end