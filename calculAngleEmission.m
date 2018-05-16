function angle=calculAngleEmission(emetteur,rx,ry)
if(ry>emetteur.y)
    if(rx>emetteur.x)
        angle = atand(abs(emetteur.y-ry)/abs(emetteur.x-rx));
    end
    if(rx<emetteur.x)
        angle= 180-atand(abs(emetteur.y-ry)/abs(emetteur.x-rx));
    end
    if(rx==emetteur.x)
        angle=90;
    end
end
if(ry<emetteur.y)
    if(rx<emetteur.x)
        angle = atand(abs(emetteur.y-ry)/abs(emetteur.x-rx))+180;
    end
    if(rx>emetteur.x)
        angle= 360-atand(abs(emetteur.y-ry)/abs(emetteur.x-rx));
    end
    if(rx==emetteur.x)
        angle=270;
    end
end
if(ry==emetteur.y)
    if(rx>emetteur.x)
        angle=0;
    end
    if(rx<emetteur.x)
        angle=180;
    end
end
%angle=round(angle);
%angle=mod(angle,360);
end