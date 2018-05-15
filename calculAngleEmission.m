function angle=calculAngleEmission(emetteur,rx,ry)
if(ry>emetteur.y)
    if(rx>emetteur.x)
        angle = atand(abs(emetteur.y-ry)/abs(emetteur.x-rx));
    else
        angle= atand(abs(emetteur.y-ry)/abs(emetteur.x-rx))+90;
    end
else
    if(rx<emetteur.x)
        angle = atand(abs(emetteur.y-ry)/abs(emetteur.x-rx))+180;
    else
        angle= atand(abs(emetteur.y-ry)/abs(emetteur.x-rx))+270;
    end
end
angle=mod(angle,360);
end