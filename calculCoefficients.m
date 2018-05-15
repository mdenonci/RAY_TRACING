function [coefficientReflexion,coefficientTransmission]=calculCoefficients(angleIncident,angleTrans,wall,beta)
frequency = 245e+09;
w = 2*pi*frequency;
B=beta;
mu0=4*pi*(10^(-7));
epsi=wall.permRel;
sigma=wall.conduct;
a=w*sqrt(mu0*epsi/2)*sqrt(sqrt(1+(sigma/(w*epsi))^2)-1);
b=w*sqrt(mu0*epsi/2)*sqrt(sqrt(1+(sigma/(w*epsi))^2)+1);
Bm=a+b;
s=wall.e/cos(angleTrans);
Z1=120*pi;
Z2=sqrt(mu0/epsi);

coefficientTransmissionPerp=(2*Z2*cos(angleIncident))/(Z2*cos(angleIncident)+Z1*cos(angleTrans));
coefficientReflexionPerp=(Z2*cos(angleIncident)-Z1*cos(angleTrans))/(Z2*cos(angleIncident)+Z1*cos(angleTrans));

coefficientReflexion=coefficientReflexionPerp+(1-(coefficientReflexionPerp)^2)*(coefficientReflexionPerp*exp(-2*j*Bm*s)*exp(j*B*2*s*sin(angleTrans)*sin(angleIncident)))/(1-(coefficientReflexionPerp*exp(-2*j*Bm*s)*exp(j*B*2*s*sin(angleTrans)*sin(angleIncident)))^2);

coefficientTransmission=(1-(coefficientReflexionPerp)^2)*(exp(-1*j*Bm*s))/(1-(coefficientReflexionPerp*exp(-2*j*Bm*s)*exp(j*B*2*s*sin(angleTrans)*sin(angleIncident)))^2);


coefficientReflexion=0.2;
coefficientTransmission=0.2;


end