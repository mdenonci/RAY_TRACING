function emitterPrime= reflexion(emetteur,beta,wall)
[IMX, IMY,interx,intery,wall]=findReflexionAntenna(emetteur.x,emetteur.y, wall);
if (IMX>0)
    if(IMY>0)
        if(emetteur.reflex && emetteur.oldX==IMX && emetteur.oldY==IMY)
            emitterPrime=emitter(-1,-1,emetteur.GTX,emetteur.PTX,true,false);
        else
            emitterPrime= emitter(IMX,IMY,emetteur.GTX,emetteur.PTX,true,false);
            emitterPrime.wallIntersectionX=interx;
            emitterPrime.wallIntersectionY=intery;
            emitterPrime.oldX=emetteur.x;
            emitterPrime.oldY=emetteur.y;
            emitterPrime.reflex=1;
            emitterPrime.wall=wall;
            emitterPrime.transmis=0;
        end
    end
end
end