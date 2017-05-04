Sommets = [10 10 ; 10 30 ; 30 40 ; 30 10];

xpol = Sommets(:,1);
ypol = Sommets(:,2);

xpoly(xpol-0.5, ypol+0.5,'lines',1)

// Attention, les sommets doivent être bien triés, pas intersectants.
// Ça marche tout de même quand ça s'intersecte.
// Algorithme de détection de polygone croisé ?

jim = jimread(jimlabPath("\")+ '\tests\images\noError\rgb.jpg');
im = jim.image; //uint8
[h,w] = size(im);

// L'origine sur une fenêtre graphique est en bas à gauche.
// Mais l'origine dans une matrice est en haut à gauche.
// On doit complémentariser les les abscisses par rapport à la largeur de l'image


Sommets2=Sommets;
Sommets2(:,1)=h;
Sommets2(:,2)=w;
ypol2 = Sommets2(:,1)-Sommets(:,1);
xpol2 = Sommets(:,2);

//gray et rgb 
for i = 1:h
    for j = 1:w
        in(i,j) = point_in_polygon(ypol2, xpol2, i,j);
    end
end

out1 = in .* im(:,:,1);
out2 = in .* im(:,:,2);
out3 = in .* im(:,:,3);

// Renvoie des 0 quand la valeur des out est Inf.

out(:,:,1) = out1;
out(:,:,2) = out2;
out(:,:,3) = out3;

jimdisp(out)






//rgba
//for i = 1:50
//    for j = 1:50
//        in(i,j) = point_in_polygon(ypol, xpol, i,j);
//    end
//end

//out = in .* im(:,:,[1:3]);
//out(:,:,4)=im(:,:,4);
//mat = uint8(~isinf(out-1)) .* (out-1);
