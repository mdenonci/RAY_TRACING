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
        coefficients;
        lastReflex;
        lastTransmis;
        x1;
        x2;
        x3;
        x4;
        y1;
        y2;
        y3;
        y4;
        dist;
    end
    methods
        function obj = emitter(x,y,GTX,PTX,reflex,transmis,coefficients)
            obj.x = x;
            obj.y = y;
            obj.oldX=x;
            obj.oldY=y;
            obj.x1;
            obj.y1;
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
            obj.CurrentAngleOfEmission=0;
            obj.coefficients=coefficients;
            obj.lastReflex=0;
            obj.lastTransmis=0;
            obj.dist=0;
        end
    end
end
