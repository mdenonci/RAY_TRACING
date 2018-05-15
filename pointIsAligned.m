function boolean=pointIsAligned(emetteur,rx,ry,erreur)

boolean=false;
angleEmission=emetteur.CurrentAngleOfEmission;
anglepouratteindrelepoint=calculAngleEmission(emetteur,rx,ry);
anglepouratteindrelepoint=anglepouratteindrelepoint;
if(anglepouratteindrelepoint<angleEmission+erreur && anglepouratteindrelepoint>angleEmission-erreur)
    boolean=true;
end