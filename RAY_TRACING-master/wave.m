classdef wave
    properties
        tx_x;
        tx_y;
        direction;
        iter;
    end
    methods
        function obj = wave(x,y,d,i)
            obj.tx_x = x;
            obj.tx_y = y;
            obj.direction = d;
            obj.iter = i;
        end
    end
end