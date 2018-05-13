function [emitterT] = findTransmissionAntenna(emetteur,RX_X,RX_Y,wall)

if (wall.type == 'v')
    if (wall.xr <= RX_X)
        TRTX = wall.xr;
        theta_i = atand((abs(RX_Y-emetteur.y))/abs(RX_X-emetteur.x));
        TRTY = (tand(theta_i)*(TRTX-emetteur.x))+emetteur.y;
        GTX = emetteur.GTX;
        PTX = emetteur.PTX; %A MODIFIER POUR ATTENUATION
        emitterT = emitter(TRTX,TRTY,GTX,PTX,false,emetteur.transmis+1);
        emitterT.angleOfEmission = theta_i;
        emitterT.dir = 'RIGHT';
    elseif (wall.xl >= RX_X)
        TRTX = wall.xl;
        theta_i = atand((abs(RX_Y-emetteur.y))/abs(RX_X-emetteur.x));
        TRTY = (tand(theta_i)*(TRTX-emetteur.x))+emetteur.y;
        GTX = emetteur.GTX;
        PTX = emetteur.PTX; %A MODIFIER POUR ATTENUATION
        emitterT = emitter(TRTX,TRTY,GTX,PTX,false,emetteur.transmis+1);
        emitterT.angleOfEmission = theta_i;
        emitterT.dir = 'LEFT';
    end
    % TODO - modifier les indices ci dessous (switcher X et Y)
elseif (wall.type == 'h')
    if (wall.yu <= RX_Y)
        TRTX = wall.xr;
        theta_i = atand((abs(RX_Y-emetteur.y))/abs(RX_X-emetteur.x));
        TRTY = (tand(theta_i)*(TRTX-emetteur.x))+emetteur.y;
        GTX = emetteur.GTX;
        PTX = emetteur.PTX; %A MODIFIER POUR ATTENUATION
        emitterT = emitter(TRTX,TRTY,GTX,PTX,false,emetteur.transmis+1);
        emitterT.angleOfEmission = theta_i;
        emitterT.dir = 'UP';
    elseif (wall.yd >= RX_Y)
        TRTX = wall.xr;
        theta_i = atand((abs(RX_Y-emetteur.y))/abs(RX_X-emetteur.x));
        TRTY = (tand(theta_i)*(TRTX-emetteur.x))+emetteur.y;
        GTX = emetteur.GTX;
        PTX = emetteur.PTX; %A MODIFIER POUR ATTENUATION
        emitterT = emitter(TRTX,TRTY,GTX,PTX,false,emetteur.transmis+1);
        emitterT.angleOfEmission = theta_i;
        emitterT.dir = 'LEFT';
    end
end