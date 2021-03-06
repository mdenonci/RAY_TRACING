function [transmitOK,newTXX,newTXY,angleOfTransmission,angleOfRetransmission] = Snell_Descartes(wall,theta_i,thetaABS,entryPointX,entryPointY)

if (entryPointX <= wall.xr & entryPointX >= wall.xl & entryPointY >= wall.yd & entryPointY <= wall.yu)
    transmitOK = false;
    theta_tCORR = 90;
    DELTA_Y = 0;
    DELTA_X = 0;
    theta_t = 90;
    newTXX=0;
    newTXY=0;
    angleOfTransmission=0;
    angleOfRetransmission=0;

    eps0 = (1/(36*pi))*10^(-9);

    n_wall = sqrt(wall.permRel);%CALCUL DE L'INDICE DE REFRACTION A AJOUTER AU MUR

    if (wall.type == 'v')
        if (wall.xr >= entryPointX) %Si le rayon arrive par la gauche
            if (thetaABS >= 0 & thetaABS < 90)
                theta_tCORR = asind(sind(theta_i)/n_wall);
                theta_t = theta_tCORR;
                DELTA_Y = tand(theta_t)*(wall.e);
            elseif (thetaABS > 270 & thetaABS < 360)
                theta_tCORR = asind(sind(theta_i)/n_wall);
                theta_t = 360-theta_tCORR;
                DELTA_Y = tand(theta_t)*(wall.e);
            end

            % CONDITION DE TRANSMISSION (EFFET FENETRE DE SNELL)
            thmin = asind(1/n_wall);
            if (theta_tCORR < thmin)
                transmitOK = true;
            end

            newTXX = wall.xr;
            newTXY = entryPointY+DELTA_Y;

            angleOfTransmission = theta_t;
            angleOfRetransmission = thetaABS;

        elseif (wall.xl <= entryPointX) % Si le rayon arrive par la droite

            if (thetaABS > 90 & thetaABS <= 180)
                theta_tCORR = asind(sind(theta_i)/n_wall);
                theta_t = 180-theta_tCORR;
                DELTA_Y = tand(theta_tCORR)*(wall.e);
            elseif (thetaABS > 180 & thetaABS < 270)
                theta_tCORR = asind(sind(theta_i)/n_wall);
                theta_t = 180+theta_tCORR;
                DELTA_Y = -tand(theta_t)*(wall.e);
            end

            % CONDITION DE TRANSMISSION (EFFET FENETRE DE SNELL)
            thmin = asind(1/n_wall);
            if (theta_tCORR < thmin)
                transmitOK = true;
            end

            DELTA_Y = tand(theta_t)*(wall.e);
            newTXX = wall.xl;
            newTXY = entryPointY+DELTA_Y;

            angleOfTransmission = theta_t;
            angleOfRetransmission = thetaABS;
        end

        elseif (wall.type == 'h')
        if (wall.yd < entryPointY) %Si le rayon arrive par dessus;
           if (thetaABS > 180 & thetaABS <= 270)
                theta_tCORR = asind(sind(90-theta_i)/n_wall);
                theta_t = 180+theta_tCORR;
                DELTA_X = -tand(theta_tCORR)*(wall.e);
            elseif (thetaABS > 270 & thetaABS < 360)
                theta_tCORR = asind(sind(90-theta_i)/n_wall);
                theta_t = 360-theta_tCORR;
                DELTA_Y = tand(theta_tCORR)*(wall.e);
           end
            
            % CONDITION DE TRANSMISSION (EFFET FENETRE DE SNELL)
            thmin = asind(1/n_wall);
            if (theta_tCORR < thmin)
                transmitOK = true;
            end

            newTXY = wall.yd;
            newTXX = entryPointX+DELTA_X;

            angleOfTransmission = theta_t;
            angleOfRetransmission = thetaABS;

        elseif (wall.yu > entryPointY) %Si le rayon arrive par en bas
            if (thetaABS > 0 & thetaABS <= 90)
                theta_tCORR = asind(sind(90-theta_i)/n_wall);
                theta_t = theta_tCORR;
                DELTA_X = tand(theta_t)*(wall.e);
            elseif (thetaABS > 90 & thetaABS < 180)
                theta_tCORR = asind(sind(90-theta_i)/n_wall);
                theta_t = 180-theta_tCORR;
                DELTA_X = tand(theta_t)*(wall.e);
            end
            % CONDITION DE TRANSMISSION (EFFET FENETRE DE SNELL)
            thmin = asind(1/n_wall);
            if (theta_tCORR < thmin)
                transmitOK = true;
            end

            DELTA_X = tand(theta_t)*(wall.e);
            newTXY = wall.yu;
            newTXX = entryPointX+DELTA_X;

            angleOfTransmission = theta_t;
            angleOfRetransmission = thetaABS;
        end
    end
else
    transmitOK = false;
    theta_tCORR = 90;
    DELTA_Y = 0;
    DELTA_X = 0;
    theta_t = 90;
    
    newTXX=0;
    newTXY=0;
    angleOfTransmission=0;
    angleOfRetransmission=0;
end
end




