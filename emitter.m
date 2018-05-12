classdef emitter
    properties
        x;
        y;
        oldX;
        oldY;
        GTX;
        PTX;
        reflex;
        transmis;
        wallIntersectionX;
        wallIntersectionY;
        wall;
        dir;
        angleOfEmission;
    end
    methods
        function obj = emitter(x,y,GTX,PTX,reflex,transmis)
            obj.x = x;
            obj.y = y;
            obj.oldX=x;
            obj.oldY=y;
            obj.GTX = GTX;
            obj.PTX = PTX;
            obj.reflex=reflex;
            obj.transmis = transmis;
            obj.wallIntersectionX=-1;
            obj.wallIntersectionY=-1;
            obj.wall;
            obj.dir;
            obj.angleOfEmission;
        end
    end
end
