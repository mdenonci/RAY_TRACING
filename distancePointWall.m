function dist= distancePointWall(x,y,wall)
if(wall.type=='v')
    dist=abs(x-wall.xl);
end
if(wall.type=='h')
    dist=abs(y-wall.yl);
end
end