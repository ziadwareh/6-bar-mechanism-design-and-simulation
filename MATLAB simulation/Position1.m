function F = Position1(theta,theta2)
%theta(1) is theta3 and theta(2) is theta4
r1 = 235;
r2 = 59;
r3 = 208;
r4 = 131.75;
theta1 = 327.15;
F= [r2*cosd(theta2) + r3*cosd(theta(1)) - r1*cosd(theta1) - r4*cosd(theta(2))
    r2*sind(theta2) + r3*sind(theta(1)) - r1*sind(theta1) - r4*sind(theta(2))];
end