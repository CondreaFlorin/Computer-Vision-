%proiect REALIZAREA DE MOZAICURI
%

%%
%seteaza parametri pentru functie

%citeste imaginea care va fi transformata in mozaic
%puteti inlocui numele imaginii

%seteaza directorul cu imaginile folosite la realizarea mozaicului
%puteti inlocui numele directorului
params.numeDirector = '../data/colectie/';

params.tipImagine = 'png';
params.imgReferinta = imread('C:\Users\Admin\Desktop\Proiect1\Proiect1\data\imaginiTest\frog.JPG');
%seteaza numarul de piese ale mozaicului pe orizontala
%puteti inlocui aceasta valoare
params.numarPieseMozaicOrizontala = 100;
%numarul de piese ale mozaicului pe verticala va fi dedus automat

%seteaza optiunea de afisare a pieselor mozaicului dupa citirea lor din
%director
params.afiseazaPieseMozaic = 0;

%seteaza modul de aranjare a pieselor mozaicului
%optiuni: 'aleator','caroiaj','hexagon'
params.modAranjare = 'caroiaj';

%seteaza criteriul dupa care realizeze mozaicul
%optiuni: 'aleator','distantaCuloareMedie'
params.criteriu = 'distantaCuloareMedie';
%%
%apeleaza functia principala

for i = 25:25:100
params.numarPieseMozaicOrizontala = i;
imgMozaic = construiesteMozaic(params);
imwrite(imgMozaic,strcat(int2str(i),params.modAranjare,'frog','cifirfrog.jpg'));
figure, imshow(imgMozaic)
end
