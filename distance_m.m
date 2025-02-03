%calculate distance in kilometers between two GPS locations
function [ D ] = distance_m(lat,lon)
    Vx = (lat(2)-lat(1))*111.7e3;
    Vy = (lon(2)-lon(1))*111.7e3*cos((lat(1)+lat(2))/2*pi/180.0);
    D = sqrt( Vx*Vx + Vy*Vy );
return
