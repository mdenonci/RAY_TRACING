function boolean=pointIsAligned(emitter,rx,ry)

boolean=false;

if(emitter.dir == 'RIGHT' & rx > emitter.x)
    theta = atand((abs(ry-emitter.y))/(abs(emitter.x-rx)));

    if(theta == emitter.angleOfEmission)
        boolean=true;
    end
end