function power_matrix= puissanceEquation(emetteur,power_matrix,rx_x,rx_y,beta)
d = sqrt((rx_x-emetteur.x)^2 + (rx_y-emetteur.y)^2);
dtotal=d+emetteur.dist;
c = 299792458;
freq = 295e+7;
lambda=c/freq;
Ra=73;
coefficient=emetteur.coefficients;
E=coefficient*sqrt(60*emetteur.GTX*emetteur.PTX)*(exp(-j*beta*dtotal))/dtotal;
hauteurEqui=calculHauteurEquivalente(lambda,emetteur.CurrentAngleOfEmission);
power_matrix(rx_y,rx_x) = power_matrix(rx_y,rx_x)+(hauteurEqui*E);
end