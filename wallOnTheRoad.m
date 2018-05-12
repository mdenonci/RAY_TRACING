function wallsOnTheRoad= wallOnTheRoad(emetteur,rx_x,rx_y,walls)
TX_X=emetteur.x;
TX_Y=emetteur.y;
wallsOnTheRoad=[];
for w = walls
    if(w.type=='v')
        xmax=max(rx_x,TX_X);
        xmin=min(rx_x,TX_X);
        vectDir=(rx_y-TX_Y)/(rx_x-TX_X);
        b=TX_Y-(vectDir*TX_X);
        xw=w.xl;
        yBegin=w.yd;
        yEnd=w.yu;
        if(xmin<xw && xw<xmax)
            yCorr=round((vectDir*xw)+b);
            for y=yBegin:yEnd
                if(yCorr==y)
                    w.dist=sqrt(((y-TX_Y)^2)+((xw-TX_X)^2));
                    wallsOnTheRoad=[wallsOnTheRoad w];
                end
            end
        end
    end
    if(w.type=='h')
        ymax=max(rx_y,TX_Y);
        ymin=min(rx_y,TX_Y);
        vectDir=(rx_x-TX_X)/(rx_y-TX_Y);
        b=TX_X-(vectDir*TX_Y);
        yw=w.yd;
        xBegin=w.xl;
        xEnd=w.xr;
        if(ymin<yw && yw<ymax)
            xCorr=round((vectDir*yw)+b);
            for x=xBegin:xEnd
                if(xCorr==x)
                    w.dist=sqrt(((yw-TX_Y)^2)+((x-TX_X)^2));
                    wallsOnTheRoad=[wallsOnTheRoad w];
                    
                end
            end
        end
    end
end

end