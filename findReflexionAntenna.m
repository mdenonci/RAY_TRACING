function [IMX,IMY,wallIntersectionX,wallIntersectionY,wall] = findReflexionAntenna(TX_X,TX_Y, wall)

IMX=-1;
IMY=-1;
wallIntersectionX=-1;
wallIntersectionY=-1;
if(wall.type=='v')
    if(wall.xl > TX_X)
        distance = wall.xl - TX_X;
        IMX = wall.xl + distance;
        IMY = TX_Y;
        wallIntersectionX=wall.xl;
        wallIntersectionY=TX_Y;
    end

    if(wall.xr < TX_X )
        distance = TX_X - wall.xr;
        IMX = wall.xr - distance;
        IMY = TX_Y;
        wallIntersectionX=wall.xl;
        wallIntersectionY=TX_Y;
    end
end
if(wall.type=='h')
    if(wall.yd >= TX_Y)
        distance = wall.yd - TX_Y;
        IMX = TX_X;
        IMY = wall.yd + distance;
        wallIntersectionX=TX_X;
        wallIntersectionY=wall.yd;
    end

    if(wall.yu >= TX_Y)
        distance = wall.yu - TX_Y;
        IMX = TX_X;
        IMY = wall.yu + distance;
        wallIntersectionX=TX_X;
        wallIntersectionY=wall.yu;
    end
end
end