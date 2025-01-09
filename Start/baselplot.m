x = 0:0.01:14;
plot(x,besselj (0,x), besselj (1,x));
legend('BesselJ0', 'derivative');
pause;

