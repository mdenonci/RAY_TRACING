function wall=firstWallOnTheRoad(emetteur,walls)
x=emetteur.x;
y=emetteur.y;
min=50000;
for w=walls
    if(emetteur.reflex==1 && emetteur.wall.xl==w.xl && emetteur.wall.yu==w.yu && max(size(walls))>1)
    else
        if(w.dist<min)
            min=w.dist;
        end
    end
    for w=walls
        if(w.dist==min)
            wall=w;
        end
    end
end
end

    