classdef emitter
    properties
        x;
        y;
        GTX;
        PTX;

    end
    methods
        function obj = emitter(x,y,GTX,PTX)
            obj.x = x;
            obj.y = y;
            obj.GTX = GTX;
            obj.PTX = PTX;

        end
    end
end
