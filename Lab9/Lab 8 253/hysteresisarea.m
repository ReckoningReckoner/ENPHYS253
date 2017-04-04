function [A] = hysteresisarea(vx,vy)
A = 0;
i = 1;
while i < length(vx)
    h = vx(i+1)-vx(i);
    y = (vy(i+1)+vy(i))/2;
    A = A + h*y;
    i = i +1;
end
A = - A;
end



