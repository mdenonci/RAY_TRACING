function [true] = checkVerticalAlignment(tx,ty,rx,ry,wall)

true = 0;

if(tx < wall.xl)
    if (angleInRange(tx,ty,rx,ry,wall) == 1)
        true = 1;
    end
elseif (tx > wall.xr)
    if (angleInRange(tx,ty,rx,ry,wall) == 1)
        true = 1;
    end
end
end