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
end
    
if (wall.type == 'h')
    yRefPoint = wall.yu;
    theta = atand(abs(emitter.x-rx)/abs(emitter.y-ry));
    if (emitter.x >= rx)
        xRefPoint = -(tand(theta)*(abs(emitter.y-yRefPoint)))+emitter.x;
    elseif (emitter.x < rx)
        xRefPoint = (tand(theta)*(abs(emitter.y-yRefPoint)))+emitter.x;
    end
end
    refPoint = [xRefPoint,yRefPoint];
end
