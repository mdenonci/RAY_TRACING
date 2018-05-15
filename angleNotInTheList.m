function boolean= angleNotInTheList(angle,angleList)
boolean=true;
for a=angleList
    if(angle==a)
        boolean=false;
    end
end
end