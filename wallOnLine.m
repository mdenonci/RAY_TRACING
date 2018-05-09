function [true] = wallOnLine(tx,ty,rx,ry,wall_list,refl,actual_wall)

true = 0;

for wall = wall_list
    cond = 0;
    if(refl == 1)
        if ((wall.xr == actual_wall.xr) & (wall.yu == actual_wall.yu))
        else
            cond = 1;
        end
    elseif(refl == 0)
        cond = 1;
    end
    if(cond == 1)
        if (wall.type == 'v')
            if(checkVerticalAlignment(tx,ty,rx,ry,wall) == 1 & ((wall.xr > rx & wall.xr < tx) | (wall.xl < rx & wall.xl > tx)))
                true = 1;
                break;
            end
        elseif (wall.type == 'h')
            true = 0;
            %TODO
        end
    end
end