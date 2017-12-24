function E = calculeazaEnergie(img)
%calculeaza energia la fiecare pixel pe baza gradientului
%input: img - imaginea initiala
%output: E - energia

%urmati urmatorii pasi:
%transformati imaginea in grayscale
%folositi un filtru sobel pentru a calcula gradientul in directia x si y
%calculati magnitudiena gradientului
%E - energia = gradientul imaginii
%completati aici codul vostru

img_gri = rgb2gray(img);
img_x = imfilter(double(img_gri), fspecial('sobel')); 
img_y = imfilter(double(img_gri'), fspecial('sobel')); 
E = abs(img_x)+abs(img_y');
