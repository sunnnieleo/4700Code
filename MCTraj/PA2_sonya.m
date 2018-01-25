%PA #2: part 2

close all
clear
clc

X0(1) = 0; %inital x position
v0(1) = 0; %inital velocity
PeskyParticleX(1) = 500;
PeskyParticleY(1) = 9.999;
PeskyParticleV(1) = 1; %initla velocity 5m/s
Y0 = 10; %inital y position
m1 = 0.5; %mass in kg 
a1 = 6; %acceleration
F1= m1*a1;

m2 = 0.003;

%BearProximity = rand; %randome number from 0 to 1.

ProbScatt = 0.95; % 0.05% chance to scattter


for t =2:10 %for every second starting form 1 to 10s
%    Fy = m*g;
%    Fx = m*BearProximity; %The closer the bear the faster the particle run
    Fy = m1*a1;
    X0(t) = X0(t-1) + F1/m1*t^2;
    v0(t) = v0(t-1) + F1/m1*t;
    
    PeskyParticleX(t) = PeskyParticleX(t-1) + F1/m2*t;
    PeskyParticleV(t) = PeskyParticleV(t-1) + F1/m2*t;
    
    scat = rand(1);
    
   if scat >=ProbScatt
       v0(t) = 0;
       PeskyParticleV(t) = PeskyParticleV(t-1)+7;
   elseif scat <ProbScatt && scat>0.03
       PeskyParticleV(t) = 0; 
   end
    
   DriftV =  sum(v0)/length(v0)
   DriftVPP =  sum(PeskyParticleV)/length(PeskyParticleV)
   
   figure (1)
   subplot(4,1,1)
   plot(X0, Y0, '.b')
   axis([0 2500 9.99 10.01])
   hold on
   title ('position Original particle over time')
   pause(.2)  

   subplot(4,1,2)
   %axis([0 2500 9.99 10.01])
   hold on
   plot(PeskyParticleX, PeskyParticleY, '.m')
   title ('position Pesky Particle over time')
   pause(.2)  
   
   subplot(4,1,3)
   plot (DriftV, t, '.r')
   hold on
   axis([0 140 2 10])
   pause(.2)
   title ('drift velocity original particle over time')
   xlabel('time, s')
   ylabel('drift velocity')
   
   subplot(4,1,4)
   plot (DriftVPP, t) %, '.k')
   hold on
   %axis([0 140 2 10])
   pause(0.2)
   title ('drift velocity pesky particle over time')
   xlabel('time, s')
   ylabel('drift velocity')
   
end

