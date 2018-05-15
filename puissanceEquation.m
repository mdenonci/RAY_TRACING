function power_matrix= puissanceEquation(emetteur,power_matrix,rx_x,rx_y,beta)
d = sqrt((rx_x-emetteur.x)^2 + (rx_y-emetteur.y)^2);
coefficient=emetteur.coefficients;
%E=coefficient*abs(sqrt(60*emetteur.GTX*emetteur.PTX))*(exp(-j*beta*d))/d;
%power_matrix(rx_y,rx_x) = power_matrix(rx_y,rx_x) +E;
power_matrix(rx_y,rx_x) = power_matrix(rx_y,rx_x) + 4/d;
end