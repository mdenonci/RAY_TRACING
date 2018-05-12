function wall= lastWallOnTheRoad(x,y,walls)
wall=walls(1);
dist=distancePointWall(x,y,wall);

for w=walls
    distChallenger=distancePointWall(x,y,w);
    if(distChallenger<dist)
        dist=distChallenger;
        wall=w;
    end
end
end