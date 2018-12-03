function boolean =wallIsTheReflex(emetteur,wall)
boolean=false;
if(emetteur.wall.xl==wall.xl && emetteur.wall.yu==wall.yu)
    boolean=true;
end
end