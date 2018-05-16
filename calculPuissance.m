function [power_matrix,emitterReflexPrimeList,emitterTransmPrimeList]=calculPuissance(emetteur,power_matrix,X,Y,Xi,Xs,Yi,Ys,beta,walls)
emitterReflexPrimeList=[];
emitterTransmPrimeList=[];
angleReflexList=[];
 %trouve la coordonnée de l'antenne de reflexion
 
for rx_x = Xi:1:Xs %Pour tout x
    for rx_y = Yi:1:Ys %et pour tout y
        if ([rx_x,rx_y] == [emetteur.x,emetteur.y] | checkIfIntoWall(rx_x,rx_y,walls)) %On ignore le cas ou on se trouve sur l'émetteur   
        else
            if(emetteur.reflex==0 && emetteur.transmis == 0)
                if(max(size(wallOnTheRoad(emetteur,rx_x,rx_y,walls)))==0)
                    power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta);
                else
                    wallDir=firstWallOnTheRoad(emetteur,wallOnTheRoad(emetteur,rx_x,rx_y,walls));
                    angleEmission=calculAngleEmission(emetteur,rx_x,rx_y);
                    emetteur.CurrentAngleOfEmission=angleEmission;
                    emetteur.angleOfEmissionOriginal=angleEmission;
                    if(angleNotInTheList(angleEmission,angleReflexList))
                        [refPoint,theta,thetaABS] = findReflexionPoint(emetteur,wallDir,rx_x,rx_y);
                        [isTR,newTXX,newTXY,angleOfTransmission,ret] = Snell_Descartes(wallDir,theta,thetaABS,refPoint(1),refPoint(2));
                        [coefficientReflexion,coefficientTransmission]=calculCoefficients(theta,angleOfTransmission,wallDir,beta);
                        emitterReflexPrime=reflexion(emetteur,beta,wallDir,refPoint,abs(coefficientReflexion));
                        emitterReflexPrimeList=[emitterReflexPrimeList emitterReflexPrime];
                        angleReflexList=[angleReflexList angleEmission];
                    end
                    %% NOUVEL ALGORITHME POUR LES TRANSMISSIONS
                    % Il s'agit plus d'une amélioration du code d'hier au
                    % final, l'idée est de regarder en quel point aura lieu
                    % une réflexion sur le mur (du coup ça se fait en
                    % parallèle à la réflexion) puis à partir de sa
                    % position, calculer l'angle de réfraction et vérifier
                    % la condition de transmission. Ensuite on créé une
                    % antenne d'émission directionnelle.
                    [reflexionPoint, theta_i,thetaABS] = findReflexionPoint(emetteur,wallDir,rx_x,rx_y);
                    [isTR,newTXX,newTXY,angleOfTransmission,angleOfRetransmission] = Snell_Descartes(wallDir,theta_i,thetaABS,reflexionPoint(1),reflexionPoint(2));
                    if(isTR==1)
                        [coefficientReflexion,coefficientTransmission]=calculCoefficients(theta_i,angleOfTransmission,wallDir,beta);
                        emitterTransmPrime = emitter(newTXX,newTXY,emetteur.GTX,emetteur.PTX,false,emetteur.transmis+1,coefficientTransmission);
                        emitterTransmPrime.reflex=0;
                        emitterTransmPrime.CurrentAngleOfEmission = angleOfRetransmission;
                        emitterTransmPrime.wall = wallDir;
                        if emitterNotInTheList(emitterTransmPrime,emitterTransmPrimeList)
                            emitterTransmPrimeList = [emitterTransmPrimeList emitterTransmPrime];
                        end
                    end
                end
            end      
            if(emetteur.transmis >= 1)
                if(rx_x == 27 & rx_y == 37)
                    disp('a');
                end
                wallsCrossed=wallOnTheRoad(emetteur,rx_x,rx_y,walls);
                if(max(size(wallsCrossed))==0)
                    power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta);
                else
                    wallDir=firstWallOnTheRoad(emetteur,wallsCrossed);
                    angleEmission=emetteur.CurrentAngleOfEmission;
                    [refPoint,theta,thetaABS] = findReflexionPoint(emetteur,wallDir,rx_x,rx_y);
                    [isTR,newTXX,newTXY,angleOfTransmission,angleOfRetransmission] = Snell_Descartes(wallDir,theta,thetaABS,refPoint(1),refPoint(2));
                    [coefficientReflexion,coefficientTransmission]=calculCoefficients(theta,angleOfTransmission,wallDir,beta);
                    refOK = checkEmitterPositionForReflexion(emetteur,wallDir);
                    if (refOK == 1)
                        emitterReflexPrime=reflexion(emetteur,beta,wallDir,refPoint,abs(coefficientReflexion));
                        emitterReflexPrimeList=[emitterReflexPrimeList emitterReflexPrime];
                        angleReflexList=[angleReflexList angleEmission];
                    end
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
                            [isTR,newTXX,newTXY,angleOfTransmission,angleOfRetransmission] = Snell_Descartes(lastWall,theta,refPoint(1),refPoint(2));
                            [coefficientReflexion,coefficientTransmission]=calculCoefficients(theta,angleOfTransmission,lastWall,beta);
                            refOK = checkEmitterPositionForReflexion(emetteur,lastWall);
                            if (refOK == 1)
                                emitterReflexPrime=reflexion(emetteur,beta,lastWall,refPoint,abs(coefficientReflexion));
                                emitterReflexPrimeList=[emitterReflexPrimeList emitterReflexPrime];
                                angleReflexList=[angleReflexList angleEmission];
                            end
                        end
                    
                        
                    end
                end
            end
        end
    end
end
