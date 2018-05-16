function inWall = checkIfIntoWall(rx,ry,walls)

inWall = 0;

for w = walls
    if (rx < w.xr & rx >= w.xl)
        if(ry < w.yu & ry >= w.yd)
            inWall = 1;
        end
    end
end
end