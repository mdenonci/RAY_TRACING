function power_matrix=ondeDirecte(emetteur,rx_x,rx_y,power_matrix,beta)
    if(emetteur.reflex && verificationPositionAntennaPrime(emetteur,rx_x,rx_y) && verificationPositionWall(emetteur,rx_x,rx_y))
        interx=emetteur.wallIntersectionX;
        intery=emetteur.wallIntersectionY;
        if(abs(emetteur.x-emetteur.oldX)==0)
            dist=emetteur.y-emetteur.oldY;
            if(dist>0 && intery>rx_y)
                d = sqrt((rx_x-emetteur.x)^2 + (rx_y-emetteur.y)^2);
                power_matrix(rx_y,rx_x) = power_matrix(rx_y,rx_x) + (abs(sqrt(60*emetteur.GTX*emetteur.PTX)*(exp(-j*beta*d))/d)^2)/(2*120*pi);
            end
            if(dist<0 && intery<rx_y)
                d = sqrt((rx_x-emetteur.x)^2 + (rx_y-emetteur.y)^2);
                power_matrix(rx_y,rx_x) = power_matrix(rx_y,rx_x) + (abs(sqrt(60*emetteur.GTX*emetteur.PTX)*(exp(-j*beta*d))/d)^2)/(2*120*pi);
            end
        end
        if(abs(emetteur.y-emetteur.oldY)==0)
            dist=emetteur.x-emetteur.oldX;
            dist=dist/2;
            if(dist>0 && interx>rx_x)
                d = sqrt((rx_x-emetteur.x)^2 + (rx_y-emetteur.y)^2);
                power_matrix(rx_y,rx_x) = power_matrix(rx_y,rx_x) + (abs(sqrt(60*emetteur.GTX*emetteur.PTX)*(exp(-j*beta*d))/d)^2)/(2*120*pi);
            end
            if(dist<0 && interx<rx_x)
                d = sqrt((rx_x-emetteur.x)^2 + (rx_y-emetteur.y)^2);
                power_matrix(rx_y,rx_x) = power_matrix(rx_y,rx_x) + (abs(sqrt(60*emetteur.GTX*emetteur.PTX)*(exp(-j*beta*d))/d)^2)/(2*120*pi);
            end
        end
    end          
    if(emetteur.reflex==false)
    d = sqrt((rx_x-emetteur.x)^2 + (rx_y-emetteur.y)^2);
    power_matrix(rx_y,rx_x) = power_matrix(rx_y,rx_x) + (abs(sqrt(60*emetteur.GTX*emetteur.PTX)*(exp(-j*beta*d))/d)^2)/(2*120*pi);
    end
end