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
        materiaux;
        permRel;
        conduct;
    end
    methods
        function obj = wall(type,xl,yu,l,e,reflex,materiaux)
            obj.type = type;
            obj.xl = xl;
            obj.yu = yu;
            obj.l = l;
            obj.e = e;
            obj.rayInterX=xl;
            obj.rayInterY=yu;
            obj.dist=10000;
            obj.reflex=reflex;
            obj.materiaux = materiaux;
            if (type == 'v')
                obj.xr = xl+e;
                obj.yd = yu-l;
            elseif (type == 'h')
                obj.xr = xl+l;
                obj.yd = yu+e;
            end
            if(materiaux == 0)
                obj.permRel=4.6;
                obj.conduct=0.02;
            end
            if(materiaux == 1)
                obj.permRel=5;
                obj.conduct=0.014;
            end
            if(materiaux == 2)
                obj.permRel=2.25;
                obj.conduct=0.04;
            end
        end
    end
end