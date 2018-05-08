function [true] = checkHorizontalAlignment(tx,ty,rx,ry,wall)

true = 0;

%TODO - Adapter aux reflexions horizontales

if(tx < wall.xl)
    %Transmission IMG-RX dans le premier & second Quadrants
    lineAngle = atand((ry-ty)/(rx-tx));
    supAngle = atand((wall.yu-ty)/(wall.xr-tx));
    infAngle = atand((wall.yd-ty)/(wall.xr-tx));
    if (lineAngle <= supAngle && lineAngle >= infAngle)
        true = 1;
    end
elseif (tx > wall.xr)
    %Transmission IMG-RX dans le second et troisième Quadrants
    lineAngle = atand((ry-ty)/(tx-rx));
    supAngle = atand((wall.yu-ty)/(tx-wall.xl));
    infAngle = atand((wall.yd-ty)/(tx-wall.xl));
    if (lineAngle <= supAngle && lineAngle >= infAngle)
        true = 1;
    end
end
end