function boolean=pointIsUnderTheLine(x1,y1,x2,y2,x,y)
boolean=false;
vectDir=(y2-y1)/(x2-x1);
b=y1-(vectDir*x1);
if(y<=ceil(vectDir*x+b))
    boolean=true;
end