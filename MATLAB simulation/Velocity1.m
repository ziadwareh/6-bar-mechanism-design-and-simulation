function [W2,W3,W4] = Velocity1(theta2,theta3,theta4)
w2 = -10;
r2 = 59;
r3 = 208;
r4 = 131.75;
syms w3 w4
eqn1 = w2*r2*cosd(theta2) + w3*r3*cosd(theta3) == w4*r4*cosd(theta4);
eqn2 = w2*r2*sind(theta2) + w3*r3*sind(theta3) == w4*r4*sind(theta4);
sol = solve([eqn1,eqn2],[w3,w4]);
W2 = w2;
W3 = cast(sol.w3,'single');
W4 = cast(sol.w4, 'single');
end