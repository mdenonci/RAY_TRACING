function [NEWWALLS,NEWEMITTERS] = shiftElements(walls_list,emitter_list,shiftX,shiftY)

NEWWALLS = [];
NEWEMITTERS = [];

for wallOld = walls_list
    wallCopy = wall(wallOld.type,wallOld.xl+shiftX,wallOld.yu+shiftY,wallOld.l,wallOld.e,wallOld.reflex,wallOld.materiaux);
    NEWWALLS = [NEWWALLS wallCopy];
end

for emitterOld = emitter_list
    emitterCopy = emitter(emitterOld.x+shiftX,emitterOld.y+shiftY,emitterOld.GTX,emitterOld.PTX,emitterOld.reflex,emitterOld.transmis,emitterOld.coefficients);
    NEWEMITTERS = [NEWEMITTERS emitterCopy];
end