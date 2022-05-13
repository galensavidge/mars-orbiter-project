function [td] = euler_EOM_321(t, w)

c2 = cosd(t(2));
s2 = sind(t(2));
c3 = cosd(t(3));
s3 = sind(t(3));

C = [0, s3, c3;
     0, c2*c3, -c2*s3;
     c2, s2*s3, s2*c3] * 1/c2;

td = C*w;