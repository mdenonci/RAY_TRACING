function boolean=pointIsAligned(emitter,rx,ry)

boolean=false;

if(rx > emitter.x)
    theta = atand((abs(ry-emitter.y))/(abs(emitter.x-rx)));

    if(theta <= emitter.angleOfEmission+0.5 & theta >= emitter.angleOfEmission-0.5)
        boolean=true;
    end
end