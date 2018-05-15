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

%%ne fonctionne pas, probleme de newTXX non assigné
% function [transmitOK,newTXX,newTXY,angleOfTransmission,GTX,PTX] = Snell_Descartes(wall,theta_i,entryPointX,entryPointY)
% 
% GTX = 1; %A CALCULER
% PTX = 1; %A CALCULER
% transmitOK = false;
% 
% n_wall = 1.001;%wall.n; %CALCUL DE L'INDICE DE REFRACTION A AJOUTER AU MUR
% 
% if (wall.type == 'v')
%     if (wall.xr > entryPointX) %Si le rayon arrive par la gauche
%         theta_t = asin(sin(theta_i)/n_wall); %verifier la formule
% 
%         % CONDITION DE TRANSMISSION (EFFET FENETRE DE SNELL)
%         if (theta_t < asin(1/n_wall))
%             transmitOK = true;
%         end
% 
%         DELTA_Y = tan(theta_t)*(wall.e);
%         newTXX = wall.xr;
%         newTXY = entryPointY+DELTA_Y;
% 
%         angleOfTransmission = theta_i;
%     elseif (wall.xl < entryPointX) % Si le rayon arrive par la droite
%         angleConv = 180-theta_i;
%         theta_t = asin(sin(angleConv)/n_wall); %verifier la formule
% 
%         % CONDITION DE TRANSMISSION (EFFET FENETRE DE SNELL)
%         if (theta_t < asin(1/n_wall))
%             transmitOK = true;
%         end
% 
%         DELTA_Y = tan(theta_t)*(wall.e);
%         newTXX = wall.xl;
%         newTXY = entryPointY+DELTA_Y;
% 
%         angleOfTransmission = theta_i;
%     end
% elseif (wall.type == 'h')
%     if (wall.yd < entryPointY) %Si le rayon arrive par dessus;
%         angleConv = 90-(theta_i-180);
%         theta_t = asin(sin(angleConv)/n_wall); %verifier la formule
%     
%         % CONDITION DE TRANSMISSION (EFFET FENETRE DE SNELL)
%         if (theta_t < asin(1/n_wall))
%             transmitOK = true;
%         end
% 
%         DELTA_X = tan(theta_t)*(wall.e);
%         newTXY = wall.yd;
%         newTXX = entryPointX+DELTA_X;
%     
%         angleOfTransmission = theta_i;
%         
%     elseif (wall.yu > entryPointY) %Si le rayon arrive par en bas
%         angleConv = 90-theta_i;
%         theta_t = asin(sin(angleConv)/n_wall); %verifier la formule
%     
%         % CONDITION DE TRANSMISSION (EFFET FENETRE DE SNELL)
%         if (theta_t < asin(1/n_wall))
%             transmitOK = true;
%         end
% 
%         DELTA_X = tan(theta_t)*(wall.e);
%         newTXY = wall.yu;
%         newTXX = entryPointX+DELTA_X;
%     
%         angleOfTransmission = theta_i;
%     end
% end



