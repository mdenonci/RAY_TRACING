function boolean=pointIsAligned(emetteur,rx,ry,erreur)

boolean=false;

angleEmission=emetteur.CurrentAngleOfEmission;

angleReach=calculAngleEmission(emetteur,rx,ry);

if(angleReach <= angleEmission+erreur & angleReach >= angleEmission-erreur)
    boolean=true;
end