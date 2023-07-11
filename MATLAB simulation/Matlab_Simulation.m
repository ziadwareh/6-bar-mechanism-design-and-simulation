%clearing past calculations
clc
clear all
%defining the linewidth of all the plots in this session
set(0,'DefaultLineLineWidth',2)
%The four bar mechanism 
%Position Analysis
%These are the initial conditions of theta3 and theta4 when theta2 was equal 0
theta0=[355.43,58.92];
i=1;
for theta2 = 0:1:360
    horiz(i)=theta2;
    positions = @(x)Position1(x,theta2);
    thetas(:,i) = fsolve(positions,theta0);
    i=i+1;
end
figure
hold
plot(horiz(1,:),horiz(1,:),'Color','r','LineStyle','--');
plot(horiz(1,:),thetas(1,:),'b',horiz(1,:),thetas(2,:),'y');
title('\theta3 & \theta4 wrt \theta2')
xlabel('\theta2 (degrees)')
ylabel('\theta3 & \theta4 (degrees)')
legend('\theta 2','\theta 3','\theta 4')
%velocity analysis
for i=1:1:361
    %Passing thetas 2,3 & 4 respectively as parameters to the velocity function
    [w(1,i),w(2,i),w(3,i)]= Velocity1(horiz(i),thetas(1,i),thetas(2,i));
end
figure
hold
plot(horiz(1,:),w(1,:),'Color','r','LineStyle','--');
plot(horiz(1,:),w(2,:),'b',horiz(1,:),w(3,:),'y');
title('\omega3 & \omega4 wrt \omega2')
xlabel('\theta2 (degrees)')
ylabel('\omega3 & \omega4 (rad/s)')
legend('\omega2','\omega3','\omega4')
%acceleration analysis
for i=1:1:361
    %Passing thetas 2,3 & 4 respectively as parameters to the velocity function
    [a(1,i),a(2,i),a(3,i)]= Acceleration1(horiz(i),thetas(1,i),thetas(2,i),w(2,i),w(3,i));
end
figure
hold
plot(horiz(1,:),a(1,:),'Color','r','LineStyle','--');
plot(horiz(1,:),a(2,:),'b',horiz(1,:),a(3,:),'y');
title('\alpha3 & \alpha4 wrt \alpha2')
xlabel('\theta2 (degrees)')
ylabel('\alpha3 & \alpha4 (rad/s^2)')
legend('\alpha2','\alpha3','\alpha4')
%Four bar mechanism done
%Slider mechanism part analysis
%These are the initial conditions of theta5 and r6 when theta2 was equal 0
x0=[172.53,33.396];
for i=1:1:361
    positions = @(x)Position2(x,thetas(2,i));
    thetas_(:,i) = fsolve(positions,x0);
end
figure
hold
plot(horiz(1,:),horiz(1,:),'Color','k','LineStyle','--');
plot(horiz(1,:),thetas(2,:),'Color','r','LineStyle','--');
plot(horiz(1,:),thetas_(1,:),'b');
title('\theta5 wrt \theta2')
xlabel('\theta2 (degrees)')
ylabel('\theta5 (degrees)')
legend('\theta2','\theta4','\theta5')
%velocity analysis
for i=1:1:361
    %Passing thetas 4',5 & r6 respectively as parameters to the velocity function
     [v(1,i),v(2,i)]= Velocity2(thetas(2,i),thetas_(1,i),w(3,i));
end
figure
hold
plot(horiz(1,:),w(1,:),'Color','k','LineStyle','--');
plot(horiz(1,:),w(3,:),'Color','r','LineStyle','--');
plot(horiz(1,:),v(1,:),'b');
title('\omega5 wrt \omega2')
xlabel('\theta2 (degrees)')
ylabel('\omega5 (rad/s)')
legend('\omega2','\omega4','\omega5')
%acceleration analysis
for i=1:1:361
    %Passing thetas 2,3 & 4 respectively as parameters to the velocity function
    [a_(1,i),a_(2,i)]= Acceleration2(thetas(2,i),thetas_(1,i),w(3,i),v(1,i),a(3,i));
end
figure
hold
plot(horiz(1,:),a(1,:),'Color','k','LineStyle','--');
plot(horiz(1,:),a(3,:),'Color','r','LineStyle','--');
plot(horiz(1,:),a_(1,:),'b');
title('\alpha5 wrt \alpha2')
xlabel('\theta2 (degrees)')
ylabel('\alpha5 (rad/s^2)')
legend('\alpha2','\alpha4','\alpha5')
%Ploting the Slider's dynamics alone
figure
hold
plot(horiz(1,:),horiz(1,:),'Color','k','LineStyle','--');
plot(horiz(1,:),w(1,:),'Color','k','LineStyle','--');
plot(horiz(1,:),a(1,:),'Color','k','LineStyle','--');
plot(horiz(1,:),thetas_(2,:),'r',horiz(1,:),v(2,:),'b',horiz(1,:),a_(2,:),'y');
title('Output vs. Input')
xlabel('\theta2 (degrees)')
ylabel('r6 v6 a6')
legend('\theta2 (degrees)','\omega2 (rad/s)','\alpha2 (rad/s^2)','R6 (cm)','V6 (cm/s)','A6 (cm/s^2)')