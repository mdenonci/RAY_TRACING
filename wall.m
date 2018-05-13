classdef wall
    properties
        xl;
        xr;
        yu;
        yd;
        e;
        l;
        rayInterX;
        rayInterY;
        dist;
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
            obj.rayInterX=xl;
            obj.rayInterY=yu;
            obj.dist=10000;
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