function boolean= wallNotInTheList(wall,walls)
boolean=true;
for w=walls
    if(w.xl==wall.xl && w.yu==wall.yu)
        boolean=false;
    end
end
end