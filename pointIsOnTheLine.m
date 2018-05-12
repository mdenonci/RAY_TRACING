function boolean=pointIsOnTheLine(x1,y1,angle,x,y)
y2 = y1+sin(angle);
x2 = x1+cos(angle);
boolean=false;
vectDir=(y2-y1)/(x2-x1);
b=y1-(vectDir*x1);
if(y==vectDir*x+b)
    boolean=true;
end