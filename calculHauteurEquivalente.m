function hauteurEquivalente=calculHauteurEquivalente(lambda,theta)
hauteurEquivalente= -1*lambda*(1/pi)*(cos((pi/2)*cos(theta)))/((sin(theta)^2));
if(sin(theta)==0)
    hauteurEquivalente=1;
end
end