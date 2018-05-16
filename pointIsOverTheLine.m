function boolean=pointIsOverTheLine(x1,y1,x2,y2,x,y)
boolean=false;
vectDir=(y2-y1)/(x2-x1);
b=y1-(vectDir*x1);
ycond = vectDir*x+b;
if(y>=floor(vectDir*x+b))
    boolean=true;
end