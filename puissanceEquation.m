function power_matrix= puissanceEquation(emetteur,power_matrix,rx_x,rx_y,beta)
d = sqrt((rx_x-emetteur.x)^2 + (rx_y-emetteur.y)^2);
dtotal=d+emetteur.dist;
lambda=0.05;
Ra=0.01;
coefficient=emetteur.coefficients;
E=coefficient*sqrt(60*emetteur.GTX*emetteur.PTX)*(exp(-j*beta*dtotal))/dtotal;
hauteurEqui=calculHauteurEquivalente(lambda,emetteur.CurrentAngleOfEmission);
Puissance=(1/(8*Ra))*(abs(E*hauteurEqui))^2;
power_matrix(rx_y,rx_x) = power_matrix(rx_y,rx_x)+Puissance;
%power_matrix(rx_y,rx_x) = power_matrix(rx_y,rx_x)+1;
end