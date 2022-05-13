function B = DCM2quaternion(C)

% Shepperd's method
tr_C = trace(C);
B02 = 0.25*(1 + tr_C);
B12 = 0.25*(1 + 2*C(1,1) - tr_C);
B22 = 0.25*(1 + 2*C(2,2) - tr_C);
B32 = 0.25*(1 + 2*C(3,3) - tr_C);

max_B2 = max([B02, B12, B22, B32]);

if max_B2 == B02
    B0 = sqrt(B02);
    B1 = 0.25*(C(2,3) - C(3,2))/B0;
    B2 = 0.25*(C(3,1) - C(1,3))/B0;
    B3 = 0.25*(C(1,2) - C(2,1))/B0;
elseif max_B2 == B12
    B1 = sqrt(B12);
    B0 = 0.25*(C(2,3) - C(3,2))/B1;
    B2 = 0.25*(C(1,2) + C(2,1))/B1;
    B3 = 0.25*(C(3,1) + C(1,3))/B1;
elseif max_B2 == B22
    B2 = sqrt(B22);
    B0 = 0.25*(C(3,1) - C(1,3))/B2;
    B1 = 0.25*(C(1,2) + C(2,1))/B2;
    B3 = 0.25*(C(2,3) + C(3,2))/B2;
else
    B3 = sqrt(B32);
    B0 = 0.25*(C(1,2) - C(2,1))/B3;
    B1 = 0.25*(C(3,1) + C(1,3))/B3;
    B2 = 0.25*(C(2,3) + C(3,2))/B3;
end

B = [B0 B1 B2 B3];
