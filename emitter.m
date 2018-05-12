classdef emitter
    properties
        x;
        y;
        oldX;
        oldY;
        GTX;
        PTX;
        reflex;
        wallIntersectionX;
        wallIntersectionY;
        wall;
    end
    methods
        function obj = emitter(x,y,GTX,PTX,reflex)
            obj.x = x;
            obj.y = y;
            obj.oldX=x;
            obj.oldY=y;
            obj.GTX = GTX;
            obj.PTX = PTX;
            obj.reflex=reflex;
            obj.wallIntersectionX=-1;
            obj.wallIntersectionY=-1;
            obj.wall;
            
        end
    end
end
