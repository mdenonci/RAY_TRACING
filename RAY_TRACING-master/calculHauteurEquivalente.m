function hauteurEquivalente=calculHauteurEquivalente(lambda,theta)

theta = 90; % Antenne Verticale ! Le theta est l'angle par rapport à l'horizontale, pas l'angle de réception
hauteurEquivalente= 1*lambda*(1/pi)*(cos((pi/2)*cos(theta)))/((sin(theta)^2));
end