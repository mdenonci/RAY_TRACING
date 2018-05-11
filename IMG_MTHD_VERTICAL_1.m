function [PRX,IMX,IMY] = IMG_MTHD_VERTICAL_1(RX_X,RX_Y,TX_X,TX_Y, wall,GTX,PTX,beta)
PRX= 0;
IMX=-1;
IMY=-1;
if(wall.xl >= TX_X && wall.xl >= RX_X)
    distance = wall.xl - TX_X;
    IMX = wall.xl + distance;
    IMY = TX_Y; 
    if(checkVerticalAlignment(IMX,IMY,RX_X,RX_Y,wall) == 1)
        d = sqrt((IMX-RX_X)^2 + (IMY-RX_Y)^2);
        PRX = (abs(sqrt(60*GTX*PTX)*(exp(-j*beta*d))/d)^2)/(2*120*pi);
    end
elseif(wall.xr <= TX_X && wall.xr <= RX_X)
    distance = TX_X - wall.xr;
    IMX = wall.xr - distance;
    IMY = TX_Y;
    if(checkVerticalAlignment(IMX,IMY,RX_X,RX_Y,wall) == 1)
        d = sqrt((IMX-RX_X)^2 + (IMY-RX_Y)^2);
        PRX = (abs(sqrt(60*GTX*PTX)*(exp(-j*beta*d))/d)^2)/(2*120*pi);
    end
end