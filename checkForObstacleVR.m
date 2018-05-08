function [obst] = checkForObstacleVR(tx,ty,angle,actual_wall,walls_list)

for wall = walls_list
    if wall ~= actual_wall
        if(an
        