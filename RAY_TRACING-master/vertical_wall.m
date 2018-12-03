classdef vertical_wall
    properties
        x;
        y1;
        y2;
        e;
    end
    methods
        function obj = vertical_wall(x,y1,y2,e)
            obj.x = x;
            obj.y1 = y1;
            obj.y2 = y2;
            obj.e = e;
        end
    end
end