function [W5,V6] = Velocity2(theta4_,theta5,w4_)
r4_ = 263.5;
r5 = 372;
syms w5 v6
eqn1 = -w4_*r4_*sind(theta4_) - w5*r5*sind(theta5) == -v6;
eqn2 = w4_*r4_*cosd(theta4_) + w5*r5*cosd(theta5) == 0;
sol = solve([eqn1,eqn2],[w5,v6]);
W5 = cast(sol.w5,'single');
V6 = cast(sol.v6, 'single');
end