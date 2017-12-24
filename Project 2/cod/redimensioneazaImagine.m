function imgRedimensionata = redimensioneazaImagine(img,parametri)
%redimensioneaza imaginea
%
%input: img - imaginea initiala
%       parametri - stuctura de defineste modul in care face redimensionarea 
%
% output: imgRedimensionata - imaginea redimensionata obtinuta


optiuneRedimensionare = parametri.optiuneRedimensionare;
metodaSelectareDrum = parametri.metodaSelectareDrum;
ploteazaDrum = parametri.ploteazaDrum;
culoareDrum = parametri.culoareDrum;

switch optiuneRedimensionare
    
    case 'micsoreazaLatime'
        numarPixeliLatime = parametri.numarPixeliLatime;
        imgRedimensionata = micsoreazaLatime(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        
    case 'miscoreazaInaltime'
        numarPixeliLatime = parametri.numarPixeliLatime;
        imgRedimensionata = micsoreazaInaltime(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        
    case 'maresteLatime'
        numarPixeliLatime = parametri.numarPixeliLatime;
        imgRedimensionata = maresteLatime(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        
    case 'maresteInaltime'
        numarPixeliLatime = parametri.numarPixeliLatime;
        imgRedimensionata = maresteInaltime(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
    
    case 'eliminaObiect'
        numarPixeliLatime = 0;
        imgRedimensionata = eliminaObiect(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
    
end