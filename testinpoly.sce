
xpol = [5 5 40 40];
ypol = [5 40 40 5];

xpoly(xpol, ypol)

jim = jimread(jimlabPath + '\tests\images\noError\rgba.png')
im = jim.image;

//gray et rgb 
for i = 1:50
    for j = 1:50
        in(i,j) = point_in_polygon(ypol, xpol, i,j);
    end
end

out = in .* im;

mat = uint8(~isinf(out)) .* out

//rgba
for i = 1:50
    for j = 1:50
        in(i,j) = point_in_polygon(ypol, xpol, i,j);
    end
end

out = in .* im(:,:,[1:3]);
out(:,:,4)=im(:,:,4);
mat = uint8(~isinf(out)) .* out;
