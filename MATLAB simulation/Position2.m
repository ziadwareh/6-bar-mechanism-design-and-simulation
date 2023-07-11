function F = Position2(x,theta4_)
%x(1) is theta5 and x(2) is r6
r4_ = 263.5;
r5 = 372;
r7 = 275;
F= [r4_*cosd(theta4_) + r5*cosd(x(1)) + x(2)
    r4_*sind(theta4_) + r5*sind(x(1)) - r7];
end