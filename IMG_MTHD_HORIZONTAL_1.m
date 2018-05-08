function [PRX] = IMG_MTHD_HORIZONTAL_1(RX_X,RX_Y,TX_X,TX_Y, wall,GTX,PTX,beta)

PRX = 0;

if(wall.yd >= TX_Y && wall.yd >= RX_Y)
    distance = wall.yd - TX_Y;
    IMY = wall.yd + distance;
    IMX = TX_X;
    if(checkHorizontalAlignment(IMX,IMY,RX_X,RX_Y,wall) == 1)
        d = sqrt((IMX-RX_X)^2 + (IMY-RX_Y)^2);
        PRX = (abs(sqrt(60*GTX*PTX)*(exp(-j*beta*d))/d)^2)/(2*120*pi);
    end
elseif(wall.xr <= TX_X && wall.xr <= RX_X)
    distance = TX_X - wall.xr;
    IMX = wall.xr - distance;
    IMY = TX_Y;
    if(checkAlignment(IMX,IMY,RX_X,RX_Y,wall) == 1)
        d = sqrt((IMX-RX_X)^2 + (IMY-RX_Y)^2);
        PRX = (abs(sqrt(60*GTX*PTX)*(exp(-j*beta*d))/d)^2)/(2*120*pi);
    end
end