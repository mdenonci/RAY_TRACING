function [refPoint,theta] = findReflexionPoint(emitter,wall,rx,ry);

refPoint = zeros(2);

if (wall.type == 'v')
    xRefPoint = wall.xl;
    theta = atand(abs(emitter.y-ry)/abs(emitter.x-rx));
    if (emitter.y >= ry)
        yRefPoint = -(tand(theta)*(abs(emitter.x-xRefPoint)))+emitter.y;
    elseif (emitter.y < ry)
        yRefPoint = (tand(theta)*(abs(emitter.x-xRefPoint)))+emitter.y;
    end
    
    refPoint = [xRefPoint,yRefPoint];
end