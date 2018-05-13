function [coefficientReflexion,coefficientTransmission]=calculCoefficients(angleIncident,angleTrans,wall,beta)
%Bm=wall.betamur
B=beta;
s=wall.e/cos(angleTrans);

%coefficientTransmissionPerp=(Z2*cos(angleIncident)-Z1*cos(angleTrans))/(Z2*cos(angleIncident)+Z1*cos(angleTrans));
coefficientReflexionPerp=(Z2*cos(angleIncident)-Z1*cos(angleTrans))/(Z2*cos(angleIncident)+Z1*cos(angleTrans));

coefficientReflexion=coefficientReflexionPerp+(1-(coefficientReflexionPerp)^2)*(coefficientReflexionPerp*exp(-2*j*Bm*s)*exp(j*B*2*s*sin(angleTrans)*sin(angleIncident)))/(1-(coefficientReflexionPerp*exp(-2*j*Bm*s)*exp(j*B*2*s*sin(angleTrans)*sin(angleIncident)))^2);

coefficientTransmission=(1-(coefficientReflexionPerp)^2)*(exp(-1*j*Bm*s))/(1-(coefficientReflexionPerp*exp(-2*j*Bm*s)*exp(j*B*2*s*sin(angleTrans)*sin(angleIncident)))^2);
end