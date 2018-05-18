function boolean= angleNotInTheList(angle,angleList)
boolean=true;
for a=angleList
    if(round(angle)==round(a))
        boolean=false;
    end
end
end