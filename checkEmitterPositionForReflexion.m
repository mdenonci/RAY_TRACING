function reflexOK = checkEmitterPositionForReflexion(emitter,wall)

reflexOK = 0;

if (wall.xl == emitter.wall.xl & wall.yu == emitter.wall.yu & wall.type == emitter.wall.type)
else
    if (wall.type == 'v')
        if (emitter.x > wall.xr)
            if (emitter.oldX > wall.xr)
                reflexOK = 1;
            end
        elseif (emitter.x < wall.xl)
            if (emitter.oldX < wall.xl)
                reflexOK = 1;
            end
        end
    elseif (wall.type == 'h')
        if (emitter.y > wall.yu)
            if (emitter.oldY > wall.yu)
                reflexOK = 1;
            end
        elseif (emitter.y < wall.yd)
            if (emitter.oldY < wall.yd)
                reflexOK = 1;
            end
        end
    end
end
end