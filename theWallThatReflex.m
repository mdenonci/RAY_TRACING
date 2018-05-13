function newWall= theWallThatReflex(walls,oldReflexWall)
xOld=oldReflexWall.rayInterX;
yOld=oldReflexWall.rayInterY;
distEmettOldWall=oldReflexWall.dist;
distRef=100000;
newWall=oldReflexWall;
for w=walls
    x=w.rayInterX;
    y=w.rayInterY;
    distWall=sqrt(((y-yOld)^2)+((x-xOld)^2));
    if(distWall<distRef && distEmettOldWall<w.dist)
        newWall=w;
    end
end
end
