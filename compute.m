function [true,xrx,yrx,distance,new_angle] = compute(xtx,ytx,angle,wall_list)

true = 0;
xrx = 0;
yrx = 0;
distance = 50000;
new_angle = 0;

if (angle <= 90 && angle >= 0)
    for wall = wall_list
        if(wall.type == 'v')
            if(wall.xul > xtx)
                angleH = atand((wall.yul-ytx)/(wall.xul-xtx));
                angleL = atand((wall.ydl-ytx)/(wall.xdl-xtx));
                angleHs = atand((wall.xdr-xtx)/(wall.ydr-ytx));
                angleLs = atand((wall.xdl-xtx)/(wall.ydl-ytx));
                compAngle = 90 - angle;
                if(angleH >= angle && angleL <= angle)
                    opp = (wall.xul-xtx)*tand(angle);
                    newdistance = sqrt(opp^2 + (wall.xul-xtx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = wall.xul;
                        yrx = ytx + opp;
                        new_angle = 180-angle;
                    end
                elseif(angleHs >= compAngle && angleLs <= compAngle)
                    opp = (wall.ydr-ytx)*tand(compAngle);
                    newdistance = sqrt(opp^2 + (wall.ydr-ytx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = xtx+opp;
                        yrx = wall.ydr;
                        new_angle = 360-angle;
                    end
                end
            end
        elseif(wall.type=='h')
            if(wall.yul > ytx)
                compAngle = 90 - angle;
                angleH = atand((wall.xdr-xtx)/(wall.ydr-ytx));
                angleL = atand((wall.xdl-xtx)/(wall.ydl-ytx));
                angleHs = atand((wall.yul-ytx)/(wall.xul-xtx));
                angleLs = atand((wall.ydl-ytx)/(wall.xdl-xtx));
                if(angleH >= compAngle && angleL <= compAngle)
                    opp = (wall.ydr-ytx)*tand(compAngle);
                    newdistance = sqrt(opp^2 + (wall.ydr-ytx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = xtx+opp;
                        yrx = wall.ydr;
                        new_angle = 360-angle;
                    end
                elseif(angleHs >= angle && angleLs <= angle)
                    opp = (wall.xul-xtx)*tand(angle);
                    newdistance = sqrt(opp^2 + (wall.xul-xtx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = wall.xul;
                        yrx = ytx + opp;
                        new_angle = 180-angle;
                    end
                end
            end
        end
    end
elseif (angle <= 180 && angle > 90)
    for wall = wall_list
        if (wall.type == 'v')
            if(wall.xdl < xtx)
                compAngleV = 180-angle;
                compAngleH = angle-90;
                angleH = atand((wall.yur-ytx)/(xtx-wall.xur));
                angleL = atand((wall.ydr-ytx)/(xtx-wall.xdr));
                angleHs = atand((xtx-wall.xdl)/(wall.ydl-ytx));
                angleLs = atand((xtx-wall.xdr)/(wall.ydr-ytx));
                if(angleH >= compAngleV && angleL <= compAngleV)
                    opp = (xtx-wall.xur)*tand(compAngleV);
                    newdistance = sqrt(opp^2 + (wall.xur-xtx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = wall.xur;
                        yrx = ytx + opp;
                        new_angle = 180-angle;
                    end
                elseif(angleHs >= compAngleH && angleLs <= compAngleH)
                    opp = (wall.ydr-ytx)*tand(compAngleH);
                    newdistance = sqrt(opp^2 + (wall.ydr-ytx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = xtx-opp;
                        yrx = wall.ydr;
                        new_angle = 360-angle;
                    end
                end
            end
        elseif (wall.type == 'h')
            if(wall.yur > ytx)
                compAngleH = angle-90;
                compAngleV = 180-angle;
                angleH = atand((xtx-wall.xdl)/(wall.ydl-ytx));
                angleL = atand((xtx-wall.xdr)/(wall.ydr-ytx));
                angleHs = atand((wall.yur-ytx)/(xtx-wall.xur));
                angleLs = atand((wall.ydr-ytx)/(xtx-wall.xdr));
                if(angleH >= compAngleH && angleL <= compAngleH)
                    opp = (wall.ydr-ytx)*tand(compAngleH);
                    newdistance = sqrt(opp^2 + (wall.ydr-ytx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = xtx-opp;
                        yrx = wall.ydr;
                        new_angle = 360-angle;
                    end
                elseif(angleHs >= compAngleV && angleLs <= compAngleV)
                    opp = (xtx-wall.xur)*tand(compAngleV);
                    newdistance = sqrt(opp^2 + (wall.xur-xtx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = wall.xur;
                        yrx = ytx + opp;
                        new_angle = 180-angle;
                    end    
                end
            end
        end
    end
elseif (angle > 180 && angle <= 270)
    for wall = wall_list
        if (wall.type == 'v')
            if(wall.xul < xtx)
                compAngleV = angle-180;
                angleH = atand((ytx-wall.ydr)/(xtx-wall.xdr));
                angleL = atand((ytx-wall.yur)/(xtx-wall.xdr));
                compAngleH = 270-angle;
                angleHs = atand((xtx-wall.xul)/(ytx-wall.yur));
                angleLs = atand((xtx-wall.xur)/(ytx-wall.yur));
                if(angleH >= compAngleV && angleL <= compAngleV)
                    opp = (xtx-wall.xdr)*tand(compAngleV);
                    newdistance = sqrt(opp^2 + (wall.xdr-xtx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = wall.xdr;
                        yrx = ytx - opp;
                        new_angle = 360-compAngleV;
                    end
                elseif(angleHs >= compAngleH && angleLs <= compAngleH)
                    opp = (ytx-wall.yur)*tand(compAngleH);
                    newdistance = sqrt(opp^2 + (ytx-wall.yur)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = xtx-opp;
                        yrx = wall.yur;
                        new_angle = 360-angle;
                    end
                end
            end
        elseif (wall.type == 'h')
            if(wall.ydr < ytx)
                compAngleH = 270-angle;
                angleH = atand((xtx-wall.xul)/(ytx-wall.yur));
                angleL = atand((xtx-wall.xur)/(ytx-wall.yur));
                compAngleV = angle-180;
                angleHs = atand((ytx-wall.ydr)/(xtx-wall.xdr));
                angleLs = atand((ytx-wall.yur)/(xtx-wall.xdr));
                if(angleH >= compAngleH && angleL <= compAngleH)
                    opp = (ytx-wall.yur)*tand(compAngleH);
                    newdistance = sqrt(opp^2 + (ytx-wall.yur)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = xtx-opp;
                        yrx = wall.yur;
                        new_angle = 360-angle;
                    end
                elseif(angleHs >= compAngleV && angleLs <= compAngleV)
                    opp = (xtx-wall.xdr)*tand(compAngleV);
                    newdistance = sqrt(opp^2 + (wall.xdr-xtx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = wall.xdr;
                        yrx = ytx - opp;
                        new_angle = 360-compAngleV;
                    end
                end
            end
        end
    end
elseif (angle > 270 && angle <= 360)
    for wall = wall_list
        if (wall.type == 'v')
            if(wall.xur > xtx)
                compAngleV = 360-angle;
                angleH = atand((ytx-wall.ydl)/(wall.xdl-xtx));
                angleL = atand((ytx-wall.yul)/(wall.xdl-xtx));
                compAngleH = angle-270;
                angleHs = atand((wall.xur-xtx)/(ytx-wall.yur));
                angleLs = atand((wall.xul-xtx)/(ytx-wall.yur));
                if(angleH >= compAngleV && angleL <= compAngleV)
                    opp = (wall.xdl-xtx)*tand(compAngleV);
                    newdistance = sqrt(opp^2 + (wall.xdl-xtx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = wall.xdl;
                        yrx = ytx - opp;
                        new_angle = 180+compAngleV;
                    end
                elseif(angleHs >= compAngleH && angleLs <= compAngleH)
                    opp = (ytx-wall.yur)*tand(compAngleH);
                    newdistance = sqrt(opp^2 + (ytx-wall.yur)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = xtx+opp;
                        yrx = wall.yur;
                        new_angle = 90-compAngleH;
                    end
                end
            end
        elseif (wall.type == 'h')
            if(wall.ydr < ytx)
                compAngleH = angle-270;
                angleH = atand((wall.xur-xtx)/(ytx-wall.yur));
                angleL = atand((wall.xul-xtx)/(ytx-wall.yur));
                compAngleV = 360-angle;
                angleHs = atand((ytx-wall.ydl)/(wall.xdl-xtx));
                angleLs = atand((ytx-wall.yul)/(wall.xdl-xtx));
                if(angleH >= compAngleH && angleL <= compAngleH)
                    opp = (ytx-wall.yur)*tand(compAngleH);
                    newdistance = sqrt(opp^2 + (ytx-wall.yur)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = xtx+opp;
                        yrx = wall.yur;
                        new_angle = 90-compAngleH;
                    end
                elseif(angleHs >= compAngleV && angleLs <= compAngleV)
                    opp = (wall.xdl-xtx)*tand(compAngleV);
                    newdistance = sqrt(opp^2 + (wall.xdl-xtx)^2);
                    if (newdistance < distance)
                        distance = newdistance;
                        true = 1;
                        xrx = wall.xdl;
                        yrx = ytx - opp;
                        new_angle = 180+compAngleV;
                    end
                end
            end
        end
    end
end