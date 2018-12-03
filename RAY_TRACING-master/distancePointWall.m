function dist= distancePointWall(x,y,wall)
if(wall.type=='v')
    ymoy=((wall.yu-wall.yd)/2)+wall.yd;
    dist=sqrt(((x-wall.xl)^2)+((y-ymoy)^2));
end
if(wall.type=='h')
    xmoy=((wall.xr-wall.xl)/2)+wall.xl;
    dist=sqrt(((x-xmoy)^2)+((y-wall.yu)^2));
end
end