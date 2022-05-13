function RnN = calc_Rn_frame(t)
% Returns the attitude of the nadir-pointing reference frame

% Inertial to orbit frame DCM
HN = calc_H_frame(t);

% Calculated manually using knowledge of the unit vectors for this frame
RnH = [-1 0 0;
        0 1 0;
        0 0 -1];

% Assemble inertial to nadir pointing reference DCM
RnN = RnH*HN;