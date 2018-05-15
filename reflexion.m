function emitterPrime= reflexion(emetteur,beta,wall,refPoint,coefficientReflexion)
[IMX, IMY,interx,intery,wall]=findReflexionAntenna(emetteur.x,emetteur.y, wall);
xRef=refPoint(1);
yRef=refPoint(2);
if (IMX>0)
    if(IMY>0)
        if(emetteur.reflex && emetteur.oldX==IMX && emetteur.oldY==IMY)
            emitterPrime=emitter(0,0,0,0,0,0);
        else
            reflex=emetteur.reflex+1;
            trans=emetteur.transmis;
            emitterPrime= emitter(IMX,IMY,emetteur.GTX,emetteur.PTX,reflex,trans);
            emitterPrime.wallIntersectionX=interx;
            emitterPrime.wallIntersectionY=intery;
            emitterPrime.oldX=emetteur.x;
            emitterPrime.oldY=emetteur.y;
            emitterPrime.reflex=emetteur.reflex+1;
            emitterPrime.wall=wall;
            emitterPrime.transmis=emetteur.transmis;
            emitterPrime.x1=emetteur.x1;
            emitterPrime.y1=emetteur.y1;
            emitterPrime.x2=emetteur.x2;
            emitterPrime.y2=emetteur.y2;
            emitterPrime.x3=emetteur.x3;
            emitterPrime.y3=emetteur.y3;
            emitterPrime.x4=emetteur.x4;
            emitterPrime.y4=emetteur.y4;
            emitterPrime.CurrentAngleOfEmission=calculAngleReflexion(emetteur,refPoint,emetteur.CurrentAngleOfEmission,wall);
            emitterPrime.angleOfEmissionOriginal=emetteur.angleOfEmissionOriginal;
            emitterPrime.coefficients=emetteur.coefficients*coefficientReflexion;
            if(emetteur.reflex+emetteur.transmis==0)
                emitterPrime.x1=xRef;
                emitterPrime.y1=yRef;
            end
            if(emetteur.reflex+emetteur.transmis==1)
                emitterPrime.x2=xRef;
                emitterPrime.y2=yRef;
            end
            if(emetteur.reflex+emetteur.transmis==2)
                emitterPrime.x3=xRef;
                emitterPrime.y3=yRef;
            end
            if(emetteur.reflex+emetteur.transmis==3)
                emitterPrime.x4=xRef;
                emitterPrime.y4=yRef;
            end
        end
    end
end
end