classdef emitter
    properties
        x;
        y;
        oldX;
        oldY;
        GTX;
        PTX;
        reflex;
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
        end
    end
end
