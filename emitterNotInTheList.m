function boolean= emitterNotInTheList(emitter,emitters)
boolean=true;

for e=emitters
    if(e.angleOfEmission == emitter.angleOfEmission & e.x == emitter.x & e.y == emitter.y)
        boolean=false;
    end
end
end