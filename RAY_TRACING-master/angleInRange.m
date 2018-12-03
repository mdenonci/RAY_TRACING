function [true] = angleInRange(tx,ty,rx,ry,wall);

true = 0;

lineAngle = atand((ry-ty)/abs(rx-tx));
supAngle = atand((wall.yu-ty)/abs(wall.xr-tx));
infAngle = atand((wall.yd-ty)/abs(wall.xr-tx));

if (lineAngle <= supAngle && lineAngle >= infAngle)
    true = 1;
end