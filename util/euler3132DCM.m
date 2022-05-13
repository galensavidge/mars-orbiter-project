function C = euler3132DCM(t1, t2, t3)
% Converts 3-2-1 Euler angles in degrees to DCM.

c1 = cosd(t1);
s1 = sind(t1);
c2 = cosd(t2);
s2 = sind(t2);
c3 = cosd(t3);
s3 = sind(t3);

% 3-1-3 DCM
C = [c3*c1-s3*c2*s1, c3*s1+s3*c2*c1, s3*s2;
     -s3*c1-c3*c2*s1, -s3*s1+c3*c2*c1, c3*s2,
     s2*s1, -s2*c1, c2];