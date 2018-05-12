function boolean = verificationPositionAntennaPrime(emetteur,rx_x,rx_y)
if(emetteur.oldY==emetteur.y)
    if(abs(emetteur.oldX-rx_x) < abs(emetteur.x-rx_x))
        boolean=true;
    else
        boolean=false;
    end
end
if(emetteur.oldX==emetteur.x)
    if(abs(emetteur.oldY-rx_y) < abs(emetteur.y-rx_y))
        boolean=true;
    else
        boolean=false;
    end
end
end
