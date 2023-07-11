function [A5, A6] = Acceleration2(theta4_,theta5,w4_, w5, a4_)
r4_ = 263.5;
r5 = 372;
syms a5 a6
eqn1 = -((w4_)^2)*r4_*cosd(theta4_) - a4_*r4_*sind(theta4_) - ((w5)^2)*r5*cosd(theta5) - a5*r5*sind(theta5) == -a6;
eqn2 = -((w4_)^2)*r4_*sind(theta4_) + a4_*r4_*cosd(theta4_) - ((w5)^2)*r5*sind(theta5) + a5*r5*cosd(theta5) == 0;
sol = solve([eqn1 eqn2],[a5,a6]);
A5 = cast(sol.a5,'single');
A6 = cast(sol.a6,'single');
end