function [refPoint,theta,thetaABS] = findReflexionPoint(emitter,wall,rx,ry);

% ATTENTION: Theta_i est retourné comme une valeur en degrés entre 0 et 90
% tandis que thetaABS est l'angle absolu, donné entre 0 et 360 %

refPoint = zeros(2);
if (wall.type == 'v')
    if (emitter.x >= wall.xr)
        xRefPoint = wall.xr;
        theta = atand(abs(emitter.y-ry)/abs(emitter.x-rx));
        if (emitter.y >= ry)
            yRefPoint = -(tand(theta)*(abs(emitter.x-xRefPoint)))+emitter.y;
            thetaABS = 180+theta;
        elseif (emitter.y < ry)
            yRefPoint = (tand(theta)*(abs(emitter.x-xRefPoint)))+emitter.y;
            thetaABS = 180-theta;
        end
    elseif (emitter.x <= wall.xl)
        xRefPoint = wall.xl;
        theta = atand(abs(emitter.y-ry)/abs(emitter.x-rx));
        if (emitter.y >= ry)
            yRefPoint = -(tand(theta)*(abs(emitter.x-xRefPoint)))+emitter.y;
            thetaABS = 360-theta;
        elseif (emitter.y < ry)
            yRefPoint = (tand(theta)*(abs(emitter.x-xRefPoint)))+emitter.y;
            thetaABS = theta;
        end
    end
end
    
if (wall.type == 'h')
    if (emitter.y >= wall.yu)
        yRefPoint = wall.yu;
        theta = 90-atand(abs(emitter.x-rx)/abs(emitter.y-ry));
        if (emitter.x >= rx)
            xRefPoint = -(tand(90-theta)*(abs(emitter.y-yRefPoint)))+emitter.x;
            thetaABS = 180+theta;
        elseif (emitter.x < rx)
            xRefPoint = (tand(90-theta)*(abs(emitter.y-yRefPoint)))+emitter.x;
            thetaABS = 360-theta;
        end
    elseif (emitter.y <= wall.yd)
        yRefPoint = wall.yd;
        theta = 90-atand(abs(emitter.x-rx)/abs(emitter.y-ry));
        if (emitter.x >= rx)
            xRefPoint = -(tand(90-theta)*(abs(emitter.y-yRefPoint)))+emitter.x;
            thetaABS = 180-theta;
        elseif (emitter.x < rx)
            xRefPoint = (tand(90-theta)*(abs(emitter.y-yRefPoint)))+emitter.x;
            thetaABS = theta;
        end
    end
end
    refPoint = [xRefPoint,yRefPoint];
end
