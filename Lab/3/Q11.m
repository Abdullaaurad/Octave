theta = 0:0.02:2*pi;

a1 = 0.5 + 1.3 .^theta;

a2 = 5 * cos(theta);

r = [a1 ;a2];

PloarGraph = polar(theta,r);

set(PloarGraph, 'LineWidth', 3);
pause;