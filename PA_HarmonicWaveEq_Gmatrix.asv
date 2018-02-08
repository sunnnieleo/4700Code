%PA #3 sonya stuhec-leonard 100963181

%wave equation in Finite Difference (FD) form 
%Delta = 1;
%E(i+1, :)-2*E(i)+E(i-1,:) + E(:, j+1)-2*E(:, j)+E(:, j-1) = alpha*E;

%boundary conditions will be constants
BC = 0;
%number of nodes desired
nx = 50;
ny = 50;

% node numbering scheme
%n =j+(i-1)*ny;

%Create G matrix
G = zeros(nx*ny, nx*ny);

for i = 1:nx
    for j = 1:ny
        %numbering scheme for G
        n =j+(i-1)*ny;
        
        if i==j
            %else BC = 0
            G(n, :) = 0;
            %Diagonal of BC = 1
            G(n, n) = 1;
        else
            %solve FD equations or put 1 an d4 in the row coresponding to
            %the i, j position
            G(n, :)= [1, -4, 1, 1, 1];
            
        end
    end
end

%[E, D] = eigs(G, 9, 'SM');


figure(1)
spy(G)
