function [transmitOK,newTXX,newTXY,angleOfTransmission,GTX,PTX] = Snell_Descartes(wall,theta_i,entryPointX,entryPointY)

GTX = 1; %A CALCULER
PTX = 1; %A CALCULER
transmitOK = false;

n_wall = 1.001;%wall.n; %CALCUL DE L'INDICE DE REFRACTION A AJOUTER AU MUR

if (wall.type == 'v')
    theta_t = asin(sin(theta_i)/n_wall); %verifier la formule
    
    % CONDITION DE TRANSMISSION (EFFET FENETRE DE SNELL)
    if (theta_t < asin(1/n_wall))
        transmitOK = true;
    end

    DELTA_Y = tan(theta_t)*(wall.e);
    newTXX = wall.xr;
    newTXY = entryPointY+DELTA_Y;
    
    angleOfTransmission = theta_i;
    
end



