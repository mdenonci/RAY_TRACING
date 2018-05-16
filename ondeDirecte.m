function power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta)
if (emetteur.lastReflex && pointIsAligned(emetteur,rx_x,rx_y,1))
    if( verificationPositionAntennaPrime(emetteur,rx_x,rx_y) && verificationPositionWall(emetteur,rx_x,rx_y))
        interx=emetteur.wallIntersectionX;
        intery=emetteur.wallIntersectionY;
        if(abs(emetteur.x-emetteur.oldX)==0)
            dist=emetteur.y-emetteur.oldY;
            dist=dist/2;
            if(dist>0 && intery>rx_y)
                power_matrix=puissanceEquation(emetteur,power_matrix,rx_x,rx_y,beta);
            end
            if(dist<0 && intery<rx_y)
                power_matrix=puissanceEquation(emetteur,power_matrix,rx_x,rx_y,beta);
            end
        end
        if(abs(emetteur.y-emetteur.oldY)==0)
            dist=emetteur.x-emetteur.oldX;
            dist=dist/2;
            if(dist>0 && interx>rx_x)
                power_matrix=puissanceEquation(emetteur,power_matrix,rx_x,rx_y,beta);
            end
            if(dist<0 && interx<rx_x)
                power_matrix=puissanceEquation(emetteur,power_matrix,rx_x,rx_y,beta);
            end
        end
    end
end
    if(emetteur.reflex==0 && emetteur.transmis==0)
        power_matrix=puissanceEquation(emetteur,power_matrix,rx_x,rx_y,beta);
    end
    
    if(emetteur.transmis>0)
        if (pointIsAligned(emetteur,rx_x,rx_y,5))
            power_matrix=puissanceEquation(emetteur,power_matrix,rx_x,rx_y,beta);
  
        end
    end
end