function boolean= verificationPositionWall(emetteur,rx_x,rx_y)
TX_X=emetteur.x;
TX_Y=emetteur.y;
wall=emetteur.wall;
boolean=false;
if(wall.type=='v')
    yBegin=wall.yd;
    yEnd=wall.yu-1;
    if(TX_X > rx_x)
        if(TX_Y<wall.yd)
            if(pointIsOverTheLine(TX_X,TX_Y,emetteur.wall.xl,yBegin,rx_x,rx_y))
                boolean=true;
            end
        end
        if(TX_Y>wall.yu)
            if(pointIsUnderTheLine(TX_X,TX_Y,emetteur.wall.xl,yEnd,rx_x,rx_y))
                boolean=true;
            end
        end
        if(wall.yd<TX_Y && TX_Y<wall.yu)
            boolean=true;
        end
    elseif(TX_X < rx_x)
        if(TX_Y<wall.yd)
            if(pointIsOverTheLine(TX_X,TX_Y,emetteur.wall.xr,yBegin,rx_x,rx_y))
                boolean=true;
            end
        end
        if(TX_Y>wall.yu)
            if(pointIsUnderTheLine(TX_X,TX_Y,emetteur.wall.xr,yEnd,rx_x,rx_y))
                boolean=true;
            end
        end
        if(wall.yd<TX_Y && TX_Y<wall.yu)
            boolean=true; %SUR
        end
    end
end
if(wall.type=='h')
    xBegin=wall.xl;
    xEnd=wall.xr;
    if(TX_Y > rx_y)
        if(TX_X<wall.xl)
            if(pointIsUnderTheLine(TX_X,TX_Y,xEnd,emetteur.wall.yd,rx_x,rx_y))
                boolean=true;
            end
        end
        if(TX_X>wall.xr)
            if(pointIsOverTheLine(TX_X,TX_Y,xEnd,emetteur.wall.yd,rx_x,rx_y))
                boolean=true;
            end
        end
        if(wall.xl<TX_X && TX_X<wall.xr)
            boolean=true;
        end
    elseif(TX_Y < rx_y)
        if(TX_X<wall.xl)
            if(pointIsOverTheLine(TX_X,TX_Y,xEnd,emetteur.wall.yu,rx_x,rx_y))
                boolean=true;
            end
        end
        if(TX_X>wall.xr)
            if(pointIsUnderTheLine(TX_X,TX_Y,xBegin,emetteur.wall.yu,rx_x,rx_y))
                boolean=true;
            end
        end
        if(wall.xl<TX_X && TX_X<wall.xr)
            boolean=true;
        end
    end
end
end