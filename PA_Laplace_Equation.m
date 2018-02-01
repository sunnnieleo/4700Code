%PA Laplace Eqution by iteration

%Sonya Stuhec-Leonard 100963181

%Part 1 done on papper
%Part 2 is below

close all
clc

nx=10;
ny=10;
a=1; %seperation of mesh points

V=zeros(nx, ny);
%i is the x location
%j is the y location

iterationsMax= 100;

for it=1:iterationsMax
    %horizontal boundary conditions
    for i= 1:nx
       for j = 1:ny        
       
            if i == 1
                V(i, j) = 1;
            elseif i== nx
                V(i, j) = 1;
            elseif j==ny %top has nothing above
                V(i, j) = 0;
                %V(i, j) = (4*a^2)^(-1)*(V(i+1, j) + V(i-1, j) + +V(i, j-1));    
            elseif j==1 %bottom has nothing below
                V(i, j) = 0;
                %V(i, j) = (4*a^2)^(-1)*(V(i+1, j) + V(i-1, j) + V(i, j+1));
            else %everything in the middle
                V(i, j) = (4*a^2)^(-1)*(V(i+1, j) + V(i-1, j) + V(i, j+1)+V(i, j-1));
            end

        end
    end
    
        figure(1)
        surf (V)
        pause(.1)
        xlabel('x')
        ylabel('y')
        
%         E= -V;
%         figure(2)
%         quiver(V)
end

