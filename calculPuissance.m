function [power_matrix,emitterReflexPrimeList]=calculPuissance(emetteur,power_matrix,X,Y,Xi,Xs,Yi,Ys,beta,walls)
emitterReflexPrimeList=[];
%emitterTransmPrimeList=[];
wallReflexList=[];
 %trouve la coordonnée de l'antenne de reflexion
 
for rx_x = Xi:1:Xs %Pour tout x
    for rx_y = Yi:1:Ys %et pour tout y
        if ([rx_x,rx_y] == [emetteur.x,emetteur.y]) %On ignore le cas ou on se trouve sur l'émetteur   
        else
            if(emetteur.reflex==0 && emetteur.transmis == 0)
                if(max(size(wallOnTheRoad(emetteur,rx_x,rx_y,walls)))==0)
                    power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta);
                else
                    wallDir=firstWallOnTheRoad(emetteur,wallOnTheRoad(emetteur,rx_x,rx_y,walls));
                    if (wallNotInTheList(wallDir,wallReflexList))
                        emitterReflexPrime=reflexion(emetteur,beta,wallDir);
                        emitterReflexPrimeList=[emitterReflexPrimeList emitterReflexPrime];
                        wallReflexList=[wallReflexList wallDir];
                    end
%                     emitterTransmPrime = findTransmissionAntenna(emetteur,rx_x,rx_y,wall);
%                     if emitterNotInTheList(emitterTransmPrime,emitterTransmPrimeList)
%                         emitterTransmPrimeList = [emitterTransmPrimeList emitterTransmPrime];
%                     end
                end
            end
                
            if(emetteur.reflex==1)
                if(wallNotInTheList(emetteur.wall,wallOnTheRoad(emetteur,rx_x,rx_y,walls)))
                else
                    wallsCrossed=wallOnTheRoad(emetteur,rx_x,rx_y,walls);
                    goodwall=theWallThatReflex(wallsCrossed,emetteur.wall);
                    if(wallIsTheReflex(emetteur,goodwall))
                        power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta);
                    else
                        if (wallNotInTheList(goodwall,wallReflexList))
                            emitterReflexPrime=reflexion(emetteur,beta,goodwall);
                            emitterReflexPrimeList=[emitterReflexPrimeList emitterReflexPrime];
                            wallReflexList=[wallReflexList goodwall];
                        end
                        

                    end
                end
            end

%                     if (wallNotInTheList(wall,wallReflexList))
%                         if(emetteur.wall.xl==wall.xl && emetteur.wall.yu==wall.yu)
%                         else
%                             emitterReflexPrime=reflexion(emetteur,beta,wall);
%                             emitterReflexPrimeList=[emitterReflexPrimeList emitterReflexPrime];
%                             wallReflexList=[wallReflexList wall];
%                         end
%                     end
%                 end
%                 
%                 
%             end

%             if(emetteur.transmis==1)
%                 if(max(size(wallOnTheRoad(emetteur,rx_x,rx_y,walls)))==0)
%                     power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta);
% %                 else
% %                     wall=firstWallOnTheRoad(emetteur,wallOnTheRoad(emetteur,rx_x,rx_y,walls));
% %                     if (wallNotInTheList(wall,wallReflexList))
% %                         emitterReflexPrime=reflexion(emetteur,beta,wall);
% %                         emitterReflexPrimeList=[emitterReflexPrimeList emitterReflexPrime];
% %                         wallReflexList=[wallReflexList wall];
% %                     end
% %                     emitterTransmPrime = findTransmissionAntenna(emetteur,rx_x,rx_y,wall);
% %                     if emitterNotInTheList(emitterTransmPrime,emitterTransmPrimeList)
% %                         emitterTransmPrimeList = [emitterTransmPrimeList emitterTransmPrime];
% %                     end
%                 end
%             end
        end
    end
end
