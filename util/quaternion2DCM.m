function C = quaternion2DCM(B)

B0 = B(1);
B1 = B(2);
B2 = B(3);
B3 = B(4);

C = [B0^2 + B1^2 - B2^2 - B3^2, 2*(B1*B2 + B0*B3), 2*(B1*B3 - B0*B2);
     2*(B1*B2 - B0*B3), B0^2 - B1^2 + B2^2 - B3^2, 2*(B2*B3 + B0*B1);
     2*(B1*B3 + B0*B2), 2*(B2*B3 - B0*B1), B0^2 - B1^2 - B2^2 + B3^2];