classdef wall
    properties
        xl;
        xr;
        yu;
        yd;
        e;
        l;
        type;
        reflex;
    end
    methods
        function obj = wall(type,xl,yu,l,e,reflex)
            obj.type = type;
            obj.xl = xl;
            obj.yu = yu;
            obj.l = l;
            obj.e = e;
            obj.reflex=reflex;
            if (type == 'v')
                obj.xr = xl+e;
                obj.yd = yu-l;
            elseif (type == 'h')
                obj.xr = xl+l;
                obj.yd = yu-e;
            end
        end
    end
end