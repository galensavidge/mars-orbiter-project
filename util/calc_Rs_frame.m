function RsN = calc_Rs_frame(~)
% Returns the attitude of the Sun-pointing reference frame

% Calculated manually using knowledge of the unit vectors for this frame
RsN = [-1 0 0;
        0 0 1;
        0 1 0];