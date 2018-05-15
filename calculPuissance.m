function [power_matrix,emitterReflexPrimeList,emitterTransmPrimeList]=calculPuissance(emetteur,power_matrix,X,Y,Xi,Xs,Yi,Ys,beta,walls)
emitterReflexPrimeList=[];
emitterTransmPrimeList=[];
angleReflexList=[];
 %trouve la coordonn�e de l'antenne de reflexion
 
for rx_x = Xi:1:Xs %Pour tout x
    for rx_y = Yi:1:Ys %et pour tout y
        if ([rx_x,rx_y] == [emetteur.x,emetteur.y]) %On ignore le cas ou on se trouve sur l'�metteur   
        else
            angleEmission=calculAngleEmission(emetteur,rx_x,rx_y);
            if(emetteur.reflex==0 && emetteur.transmis == 0)
                if(max(size(wallOnTheRoad(emetteur,rx_x,rx_y,walls)))==0)
                    %power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta);
                else
                    wallDir=firstWallOnTheRoad(emetteur,wallOnTheRoad(emetteur,rx_x,rx_y,walls));
                    angleEmission=calculAngleEmission(emetteur,rx_x,rx_y);
                    emetteur.CurrentAngleOfEmission=angleEmission;
                    emetteur.angleOfEmissionOriginal=angleEmission;
                    if(angleNotInTheList(angleEmission,angleReflexList))
                        [refPoint,theta] = findReflexionPoint(emetteur,wallDir,rx_x,rx_y);
                        [isTR,newTXX,newTXY,angleOfTransmission,newGTX,newPTX] = Snell_Descartes(wallDir,theta,refPoint(1),refPoint(2));
                        [coefficientReflexion,coefficientTransmission]=calculCoefficients(theta,angleOfTransmission,wallDir,beta);
                        emitterReflexPrime=reflexion(emetteur,beta,wallDir,refPoint,abs(coefficientReflexion));
                        emitterReflexPrimeList=[emitterReflexPrimeList emitterReflexPrime];
                        angleReflexList=[angleReflexList angleEmission];
                    end
                        
                        
                    end
                    %% NOUVEL ALGORITHME POUR LES TRANSMISSIONS
                    % Il s'agit plus d'une am�lioration du code d'hier au
                    % final, l'id�e est de regarder en quel point aura lieu
                    % une r�flexion sur le mur (du coup �a se fait en
                    % parall�le � la r�flexion) puis � partir de sa
                    % position, calculer l'angle de r�fraction et v�rifier
                    % la condition de transmission. Ensuite on cr�� une
                    % antenne d'�mission directionnelle.
                    
                    
                    % TODO pour les transmissions:
                    % >> R�flexions intra-murale
                    % >> Impl�menter la puissance d'�mission des nouvelles
                    %   antennes � partir de la distance et de l'�paisseur
                    %   travers�e
                    % >> Corriger les probl�mes potentiels d'angles
                    % >> adapter la m�thode A TOUS LES MURS
                    
%                     [reflexionPoint, theta_i] = findReflexionPoint(emetteur,wallDir,rx_x,rx_y);
%                     [isTR,newTXX,newTXY,angleOfTransmission,newGTX,newPTX] = Snell_Descartes(wallDir,theta_i,reflexionPoint(1),reflexionPoint(2));
%                     if(isTR==1)
%                         emitterTransmPrime = emitter(newTXX,newTXY,10*newGTX,10*newPTX,false,emetteur.transmis+1);
%                         emitterTransmPrime.reflex=0;
%                         emitterTransmPrime.angleOfEmission = angleOfTransmission;
%                         if emitterNotInTheList(emitterTransmPrime,emitterTransmPrimeList)
%                             emitterTransmPrimeList = [emitterTransmPrimeList emitterTransmPrime];
%                         end
%                     end
                end
            end
            
            if(emetteur.reflex>0||emetteur.transmis>0)
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
                            [refPoint,theta] = findReflexionPoint(emetteur,wallDir,rx_x,rx_y);
                            [isTR,newTXX,newTXY,angleOfTransmission,newGTX,newPTX] = Snell_Descartes(wallDir,theta,refPoint(1),refPoint(2));
                            [coefficientReflexion,coefficientTransmission]=calculCoefficients(theta,angleOfTransmission,wallDir,beta);
                            emitterReflexPrime=reflexion(emetteur,beta,wallDir,refPoint,abs(coefficientReflexion));
                            emitterReflexPrimeList=[emitterReflexPrimeList emitterReflexPrime];
                            angleReflexList=[angleReflexList angleEmission];
                        end
                    
                        
                    end
                end
            end

            

                
                
        


        end
    end
end
