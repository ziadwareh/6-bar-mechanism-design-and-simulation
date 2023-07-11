function [A2,A3,A4] = Acceleration1(theta2,theta3,theta4, w3, w4)
w2 = -10;
a2 = 0;
r2 = 59;
r3 = 208;
r4 = 131.75;
syms a3 a4
eqn1 = -((w2)^2)*r2*cosd(theta2) - a2*r2*sind(theta2) - ((w3)^2)*r3*cosd(theta3) - a3*r3*sind(theta3) == -((w4)^2)*r4*cosd(theta4) - a4*r4*sind(theta4);
eqn2 = -((w2)^2)*r2*sind(theta2) + a2*r2*cosd(theta2) - ((w3)^2)*r3*sind(theta3) + a3*r3*cosd(theta3) == -((w4)^2)*r4*sind(theta4) + a4*r4*cosd(theta4);
sol = solve([eqn1 eqn2],[a3,a4]);
A2 = 0;
A3 = cast(sol.a3,'single');
A4 = cast(sol.a4,'single');
end