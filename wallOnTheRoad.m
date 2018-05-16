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
        if (TX_X <= w.xl)
            xw=w.xr;
        elseif(TX_X >= w.xr)
            xw=w.xl;
        end
        yBegin=w.yd;
        yEnd=w.yu-1;
        if(xmin <= xw && xw <= xmax)
            if (TX_Y >= w.yu)
                yCorr=floor((vectDir*xw)+b);
            elseif (TX_Y <= w.yd)
                yCorr=ceil((vectDir*xw)+b);
            else
                yCorr=round((vectDir*xw)+b);
            end
            if (yCorr >= yBegin & yCorr <= yEnd)
                w.dist=sqrt(((yCorr-TX_Y)^2)+((xw-TX_X)^2));
                w.rayInterX=xw;
                w.rayInterY=yCorr;
                wallsOnTheRoad=[wallsOnTheRoad w];
            end
%             for y=yBegin:yEnd
%                 if(yCorr==y)
%                     w.dist=sqrt(((y-TX_Y)^2)+((xw-TX_X)^2));
%                     w.rayInterX=xw;
%                     w.rayInterY=y;
%                     wallsOnTheRoad=[wallsOnTheRoad w];
%                 end
%             end
        end
    end
    if(w.type=='h')
        ymax=max(rx_y,TX_Y);
        ymin=min(rx_y,TX_Y);
        vectDir=(rx_x-TX_X)/(rx_y-TX_Y);
        b=TX_X-(vectDir*TX_Y);
        if (TX_Y <= w.yd)
            yw=w.yu;
        elseif(TX_Y >= w.yu)
            yw=w.yd;
        end
        xBegin=w.xl;
        xEnd=w.xr-1;
        if(ymin<=yw && yw<=ymax)
            if (TX_X >= w.xr)
                xCorr=floor((vectDir*yw)+b);
            elseif (TX_X <= w.xl)
                xCorr=ceil((vectDir*yw)+b);
            else
                xCorr=round((vectDir*yw)+b);
            end
            if (xCorr >= xBegin & xCorr <= xEnd)
                w.dist=sqrt(((yw-TX_Y)^2)+((xCorr-TX_X)^2));
                w.rayInterX=xCorr;
                w.rayInterY=yw;
                wallsOnTheRoad=[wallsOnTheRoad w];
            end
%             for x=xBegin:xEnd
%                 if(xCorr==x)
%                     w.rayInterX=x;
%                     w.rayInterY=yw;
%                     w.dist=sqrt(((yw-TX_Y)^2)+((x-TX_X)^2));
%                     wallsOnTheRoad=[wallsOnTheRoad w];
%                     
%                 end
%             end
        end
    end
end

end