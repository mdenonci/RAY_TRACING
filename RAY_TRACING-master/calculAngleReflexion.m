function angleRefl=calculAngleReflexion(emetteur,reflPoint,angle,wall)
x=reflPoint(1);
y=reflPoint(2);
if(wall.type=='v')
    angleRefl=180-angle;
end
if(wall.type=='h')
        angleRefl=360-angle;
end
if(angleRefl<0)
    angleRefl=angleRefl+360;
end
end