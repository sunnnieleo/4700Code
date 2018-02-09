%PA #3 sonya stuhec-leonard 100963181

%wave equation in Finite Difference (FD) form 
%Delta = 1;
%E(i+1, :)-2*E(i)+E(i-1,:) + E(:, j+1)-2*E(:, j)+E(:, j-1) = alpha*E;

%boundary conditions will be constants
BC = 0;
%number of nodes desired
nx = 10;
ny = 10;

% node numbering scheme
%n =j+(i-1)*ny;

%Create G matrix
G = zeros(nx*ny, nx*ny);

for i = 1:nx
    for j = 1:ny
        %numbering scheme for G
        n = j+(i-1)*ny;
        
        if i==1 || i==nx || j==1 || j==ny
            %else BC = 0
            G(n, :) = 0;
            %Diagonal of BC = 1
            G(n, n) = 1;
%         elseif j==1 || j==ny
%             %else BC = 0
%             G(n, :) = 0;
%             %Diagonal of BC = 1
%             G(n, n) = 1;
        else
            %solve FD equations or put 1 an d4 in the row coresponding to
            %the i, j position
            nxMinus1 = j+(i-2)*ny;
            nxPlus1 = j+ (i)*ny;
            nyMinus1 = j-1+(i-1)*ny;
            nyPlus1 = j+1+(i-1)*ny;
            
            G(n, n)= -4;
            G(n, nxMinus1) = 1;
            G(n, nxPlus1) = 1;
            G(n, nyMinus1) = 1;
            G(n, nyPlus1) = 1;
            
        end
    end
end

[E, D] = eigs(G, 9, 'SM');


figure(1)

spy(G)
title('Spying on G matrix')

figure(2)
plot(D, '.')
title('eigen-values from the G matrix')

%define Eigen vector of nx by ny plane

for i=1:nx
    for j=1:ny
        n=j+(i-1)*ny;
        %chaning first col of E (eigen vetor) to the nx X ny matrix for
        %plotting. Chaningn which col of E you convert will change withc
        %eigen vector you look at
        E_vec(i, j) = E(n, 1); 
    end
end

figure(3)
surf(E_vec)
title('Eigen vectors of the G-matrix')
