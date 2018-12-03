function boolean =memeVecteurDir(x1,y1,x2,y2,x,y)
boolean=false;
vecteur1=(y2-y1)/(x2-x1);
vecteur2=(y2-y)/(x2-x);
if(vecteur1==vecteur2)
    boolean=true;
end
end