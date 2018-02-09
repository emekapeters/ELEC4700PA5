%Emeka Peters - 10095393
%PA5 - G matrix method

numx = 50;
numy = 50;
Gmat = sparse(numx * numy);
Bmat = zeros(1, (numx * numy));

for i = 1:numx

    for j = 1:numy
        n = j + (i - 1) * numy;
        
        if i == 1
            Gmat(n, :) = 0;
            Gmat(n, n) = 1;
            Bmat(1, n) = 1;
        elseif i == numx
            Gmat(n, :) = 0;
            Gmat(n, n) = 1;
            Bmat(1, n) = 1;
        elseif j == numy
            Gmat(n, :) = 0;
            Gmat(n, n) = 1;
            Bmat(1, n) = 1;
        else
            Gmat(n, n) = -4;
            Gmat(n, n - numx) = 1;
            Gmat(n, n + numx) = 1;
            Gmat(n, n - 1) = 1;
            Gmat(n, n + 1) = 1;
        end
    end
    
    
                

end 

spy(Gmat);

[E, D] = eigs(Gmat, 9, 'SM');

nmodes = 9;

mod = 1;

actmat = zeros(numx, numy);

for mod = 1:nmodes
    
    for i = 1:numx

        for j = 1:numy
            n = j + (i - 1) * numy;
            actmat(i, j) = E(n, mod);
        end
    end
    
    subplot(3, 3, mod); surf(actmat);
end



            
        




        
        