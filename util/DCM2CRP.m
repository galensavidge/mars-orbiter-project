function q = DCM2CRP(C)

z2 = trace(C) + 1;
q = [C(2,3) - C(3,2); C(3,1) - C(1,3); C(1,2) - C(2,1)]/z2;