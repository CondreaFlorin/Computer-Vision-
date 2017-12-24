function img = eliminaObiect(img,numarPixeliLatime,metodaSelectareDrum,ploteazaDrum,culoareDrum )
imshow(img);
rect= getrect;
xmin = floor(rect(2));
ymin = floor(rect(1));
inaltime = floor(rect(4));
latime = floor(rect(3));
DeSters = zeros(size(img,1),size(img,2));
DeSters(xmin:xmin+inaltime,ymin:ymin+latime) = 100000000;
numarPixeliLatime = latime;
Masca = ones(size(img,1),size(img,2))*100000;
for j = 1:xmin
    for k = max(1,ymin-xmin+1+j):min(size(img,2),ymin+xmin+1-j+latime)
        Masca(j,k)=0;
    end
end
Masca(xmin:xmin+inaltime,ymin:ymin+latime) = -10000;
for j = xmin+inaltime+1:size(img,1)
    for k = max(1,ymin-j+xmin+inaltime+1):min(size(img,2),ymin+latime+j+1-xmin-inaltime)
        Masca(j,k)=0;
    end
end
%while size(find(DeSters>0))>0
for i = 1:numarPixeliLatime+3
%size(find(Masca>0))
    disp(['Eliminam drumul orizonal numarul ' num2str(i) ...
        ' dintr-un total de ' num2str(numarPixeliLatime)]);
    %calculeaza energia dupa ecuatia (1) din articol
    E = calculeazaEnergie(img);
    E(:,:) = E(:,:) + Masca(:,:);
    %alege drumul vertical care conecteaza sus de jos
    drum = selecteazaDrumVertical(E,metodaSelectareDrum);
    Masca = eliminaDrumVerticalStergere(Masca,drum);
    %afiseaza drum
    if ploteazaDrum
        ploteazaDrumVertical(img,E,drum,culoareDrum);
        pause(1);
        close(gcf);
    end
    
    %elimina drumul din imagine
    img = eliminaDrumVertical(img,drum);
end
end

