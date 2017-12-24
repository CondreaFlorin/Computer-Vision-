function params = calculeazaDimensiuniMozaic(params)
%calculeaza dimensiunile mozaicului
%obtine si imaginea de referinta redimensionata avand aceleasi dimensiuni
%ca mozaicul

%completati codul Matlab
if params.numarPieseMozaicOrizontala
    params.imgReferintaRedimensionata = imresize(params.imgReferinta,(size(params.pieseMozaic(:,:,:,1),2)*params.numarPieseMozaicOrizontala/size(params.imgReferinta,2)));
    params.imgReferintaRedimensionataHexagonal = imresize(params.imgReferinta,((size(params.pieseMozaic(:,:,:,1),2)+12.5)*params.numarPieseMozaicOrizontala/size(params.imgReferinta,2)));
    params.numarPieseMozaicVerticala =  size(params.imgReferintaRedimensionata,1)/size(params.pieseMozaic(:,:,:,1),1);
    params.numarPieseMozaicVerticalaHexagonal =  size(params.imgReferintaRedimensionataHexagonal,1)/(size(params.pieseMozaic(:,:,:,1),1));
elseif numarPieseMozaicVerticala
    params.imgReferintaRedimensionata = imresize(params.imgReferinta,(size(params.pieseMozaic(:,:,:,1),2)*params.numarPieseMozaicVerticala/size(params.imgReferinta,2)));
    params.numarPieseMozaicOrizontala = floor(size(params.imgReferintaRedimensionata,2)/size(params.pieseMozaic(:,:,:,1),2));
else
    params.imgReferintaRedimensionata =  params.imgReferinta;
    params.numarPieseMozaicVerticala = floor(size(params.imgReferintaRedimensionata,2)/size(params.pieseMozaic(:,:,:,1),2));
    params.numarPieseMozaicOrizontala = floor(size(params.imgReferintaRedimensionata,1)/size(params.pieseMozaic(:,:,:,1),1));
end
