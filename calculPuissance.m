function [power_matrix,emitterReflexPrimeList]=calculPuissance(emetteur,power_matrix,X,Y,beta,walls)
emitterReflexPrimeList=[];
wallReflexList=[];
 %trouve la coordonn�e de l'antenne de reflexion
for rx_x = 1:1:X %Pour tout x
    for rx_y = 1:1:Y %et pour tout y
        if ([rx_x,rx_y] == [emetteur.x,emetteur.y]) %On ignore le cas ou on se trouve sur l'�metteur   
        else
            if(emetteur.reflex==0)
                if(max(size(wallOnTheRoad(emetteur,rx_x,rx_y,walls)))==0)
                    power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta);
                else
                    wall=firstWallOnTheRoad(emetteur,wallOnTheRoad(emetteur,rx_x,rx_y,walls));
                    if (wallNotInTheList(wall,wallReflexList))
                        emitterReflexPrime=reflexion(emetteur,beta,wall);
                        emitterReflexPrimeList=[emitterReflexPrimeList emitterReflexPrime];
                        wallReflexList=[wallReflexList wall];
                    end
                    %emitterTransmPrimeList=transmission();
                end
            end
%             if(emetteur.reflex==1)
%                 if(max(size(wallOnTheRoad(emetteur,rx_x,rx_y,walls)))<2)
%                     power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta);
%                     %emitterTransmPrimeList=transmission();
%                 else
%                     wall=firstWallOnTheRoad(emetteur,wallOnTheRoad(emetteur,rx_x,rx_y,walls));
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
        end
    end
end
