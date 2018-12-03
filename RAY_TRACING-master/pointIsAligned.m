function boolean=pointIsAligned(emetteur,rx,ry,erreur)

boolean=false;

angleEmission=round(emetteur.CurrentAngleOfEmission);

angleReach=round(calculAngleEmission(emetteur,rx,ry));

if(angleReach <= angleEmission+erreur & angleReach >= angleEmission-erreur)
    boolean=true;
end