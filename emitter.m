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
        angleOfEmissionOriginal;
        CurrentAngleOfEmission;
        angleOfEmission;
        coefficients;
        x1;
        x2;
        x3;
        x4
        y1;
        y2;
        y3;
        y4;
    end
    methods
        function obj = emitter(x,y,GTX,PTX,reflex,transmis)
            obj.x = x;
            obj.y = y;
            obj.oldX=x;
            obj.oldY=y;
            obj.x1;
            obj.y1
            obj.x2;
            obj.y2;
            obj.x3;
            obj.y3;
            obj.x4;
            obj.y4;
            obj.GTX = GTX;
            obj.PTX = PTX;
            obj.reflex=reflex;
            obj.transmis = transmis;
            obj.wallIntersectionX=-1;
            obj.wallIntersectionY=-1;
            obj.wall;
            obj.angleOfEmissionOriginal;
            obj.CurrentAngleOfEmission;
            obj.angleOfEmission;
            obj.coefficients
        end
    end
end
