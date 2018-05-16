function boolean= emitterNotInTheList(emitter,emitters)
boolean=true;

for e=emitters
    if(e.CurrentAngleOfEmission == emitter.CurrentAngleOfEmission & e.x == emitter.x & e.y == emitter.y)
        boolean=false;
    end
end
end