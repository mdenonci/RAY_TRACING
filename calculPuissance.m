function [power_matrix,emitterPrimeList]=calculPuissance(emetteur,power_matrix,X,Y,Xi,Xs,Yi,Ys,beta,walls)
emitterPrimeList=[];
angleReflexList=[];
 %trouve la coordonnée de l'antenne de reflexion
 
for rx_x = Xi:1:Xs %Pour tout x
    for rx_y = Yi:1:Ys %et pour tout y
        if ([rx_x,rx_y] == [emetteur.x,emetteur.y] | checkIfIntoWall(rx_x,rx_y,walls)) %On ignore le cas ou on se trouve sur l'émetteur   
        else
            if(emetteur.reflex==0 && emetteur.transmis == 0)
                angleEmission=calculAngleEmission(emetteur,rx_x,rx_y);
                emetteur.CurrentAngleOfEmission=angleEmission;
                emetteur.angleOfEmissionOriginal=angleEmission;
                if(max(size(wallOnTheRoad(emetteur,rx_x,rx_y,walls)))==0)
                    power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta);
                else
                    wallDir=firstWallOnTheRoad(emetteur,wallOnTheRoad(emetteur,rx_x,rx_y,walls));

                    if(angleNotInTheList(angleEmission,angleReflexList))
                        [refPoint,theta,thetaABS] = findReflexionPoint(emetteur,wallDir,rx_x,rx_y);
                        [isTR,newTXX,newTXY,angleOfTransmission,angleOfRetransmission] = Snell_Descartes(wallDir,theta,thetaABS,refPoint(1),refPoint(2));
                        [coefficientReflexion,coefficientTransmission]=calculCoefficients(theta,angleOfTransmission,wallDir,beta);
                        emitterReflexPrime=reflexion(emetteur,beta,wallDir,refPoint,coefficientReflexion);
                        emitterPrimeList=[emitterPrimeList emitterReflexPrime];
                        angleReflexList=[angleReflexList angleEmission];
                        xRef=refPoint(1);
                        yRef=refPoint(2);
                        if(isTR==1)
                            d=sqrt((xRef-emetteur.x)^2 + (yRef-emetteur.y)^2);
                            emitterTransmPrime = emitter(newTXX,newTXY,emetteur.GTX,emetteur.PTX,false,emetteur.transmis+1,emetteur.coefficients*coefficientTransmission);
                            emitterTransmPrime.lastReflex=0;
                            emitterTransmPrime.dist=emetteur.dist+d;
                            emitterTransmPrime.CurrentAngleOfEmission = angleOfRetransmission
                            emitterTransmPrime.wall = wallDir;
                            emitterTransmPrime.lastTransmis=1;
                            emitterPrimeList=[emitterPrimeList emitterTransmPrime];
                        end
                    end
                end
            end
            if(emetteur.lastTransmis == 1)
                wallsCrossed=wallOnTheRoad(emetteur,rx_x,rx_y,walls);
                if(max(size(wallsCrossed))==0)
                    %power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta);
                else

                    wallDir=firstWallOnTheRoad(emetteur,wallsCrossed);
                    angleEmission=emetteur.CurrentAngleOfEmission;
                    [refPoint,theta,thetaABS] = findReflexionPoint(emetteur,wallDir,rx_x,rx_y);
                    [isTR,newTXX,newTXY,angleOfTransmission,angleOfRetransmission] = Snell_Descartes(wallDir,theta,thetaABS,refPoint(1),refPoint(2));
                    [coefficientReflexion,coefficientTransmission]=calculCoefficients(theta,angleOfTransmission,wallDir,beta);
                    refOK = checkEmitterPositionForReflexion(emetteur,wallDir);
                    if (refOK == 1)
                        emitterReflexPrime=reflexion(emetteur,beta,wallDir,refPoint,abs(coefficientReflexion));
                        emitterPrimeList=[emitterPrimeList emitterReflexPrime];
                        angleReflexList=[angleReflexList angleEmission];
                    end
                end
            end
            if(emetteur.lastReflex==1)
                wallsCrossed=wallOnTheRoad(emetteur,rx_x,rx_y,walls);
                numberOfCrossedWalls=max(size(wallsCrossed));
                
                if(wallNotInTheList(emetteur.wall,wallsCrossed))
                else
                    goodwall=theWallThatReflex(wallsCrossed,emetteur.wall);
                    lastWall=lastWallOnTheRoad(rx_x,rx_y,wallsCrossed);
                    if(wallIsTheReflex(emetteur,lastWall))
                        power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta);
                    else
                    angleEmission=calculAngleEmission(emetteur,rx_x,rx_y);
                    emetteur.CurrentAngleOfEmission=angleEmission;
                        if(angleNotInTheList(angleEmission,angleReflexList))
                            [refPoint,theta] = findReflexionPoint(emetteur,lastWall,rx_x,rx_y);
                            xRef=refPoint(1);
                            yRef=refPoint(2);
                            [isTR,newTXX,newTXY,angleOfTransmission,angleOfRetransmission] = Snell_Descartes(lastWall,theta,refPoint(1),refPoint(2));
                            [coefficientReflexion,coefficientTransmission]=calculCoefficients(theta,angleOfTransmission,lastWall,beta);
                            refOK = checkEmitterPositionForReflexion(emetteur,lastWall);
                            if (refOK == 1)
                                emitterReflexPrime=reflexion(emetteur,beta,lastWall,refPoint,abs(coefficientReflexion));
                                emitterPrimeList=[emitterPrimeList emitterReflexPrime];
                                angleReflexList=[angleReflexList angleEmission];
                            end
                            if(isTR==1)
                                d=sqrt((xRef-emetteur.x)^2 + (yRef-emetteur.y)^2);
                                emitterTransmPrime = emitter(newTXX,newTXY,emetteur.GTX,emetteur.PTX,false,emetteur.transmis+1,emetteur.coefficients*coefficientTransmission);
                                emitterTransmPrime.lastReflex=0;
                                emitterTransPrime.dist=emetteur.dist+d;
                                emitterTransmPrime.CurrentAngleOfEmission = angleOfRetransmission;
                                emitterTransmPrime.wall = lastWall;
                                emitterTransmPrime.lastTransmis=1;
                                emitterPrimeList=[emitterPrimeList emitterTransmPrime];
                            end
                            
                        end
                    
                        
                    end
                end
            end
        end
    end
end
