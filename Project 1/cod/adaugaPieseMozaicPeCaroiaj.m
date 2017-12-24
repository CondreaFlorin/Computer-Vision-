function imgMozaic = adaugaPieseMozaicPeCaroiaj(params)
%
%tratati si cazul in care imaginea de referinta este gri (are numai un canal)

imgMozaic = uint8(zeros(size(params.imgReferintaRedimensionata)));
[H,W,C,N] = size(params.pieseMozaic);
[h,w,c] = size(params.imgReferintaRedimensionata);
PiesePuse = zeros( round(params.numarPieseMozaicVerticala+1),round(params.numarPieseMozaicOrizontala+1));
switch(params.criteriu)
    case 'aleator'
        %pune o piese aleatoare in mozaic, nu tine cont de nimic
        nrTotalPiese = params.numarPieseMozaicOrizontala * params.numarPieseMozaicVerticala;
        nrPieseAdaugate = 0;
        for i =1:params.numarPieseMozaicVerticala
            for j=1:params.numarPieseMozaicOrizontala
                %alege un indice aleator din cele N
                indice = randi(N);
                imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = params.pieseMozaic(:,:,:,indice);
                nrPieseAdaugate = nrPieseAdaugate+1;
               % fprintf('Construim mozaic ... %2.2f%% \n',100*nrPieseAdaugate/nrTotalPiese);
            end
        end
        
    case 'distantaCuloareMedie'
        %completati codul Matlab
        nrTotalPiese = params.numarPieseMozaicOrizontala * params.numarPieseMozaicVerticala;
        nrPieseAdaugate = 0;
        for i =1:params.numarPieseMozaicVerticala
            for j=1:params.numarPieseMozaicOrizontala
                %bloc de inlocuit
                params.HashCuloareMozaic;
                params.HashGriMozaic;
                indice =0;
                if c==3
                bloc = params.imgReferintaRedimensionata((i-1)*H+1:i*H,(j-1)*W+1:j*W,:);
                meanCul(1) = mean(mean(bloc(:,:,1)));
                meanCul(2) = mean(mean(bloc(:,:,2)));
                meanCul(3) = mean(mean(bloc(:,:,3)));
                %alege indice
                min = 1000;
                indice = 1;
                for k = 1:N
                   % distanta = sqrt(abs(params.HashCuloareMozaic(1,k)*params.HashCuloareMozaic(1,k)-meanCul(1)*meanCul(1)))+sqrt(abs(params.HashCuloareMozaic(2,k)*params.HashCuloareMozaic(2,k)-meanCul(2)*meanCul(2)))+sqrt(abs(params.HashCuloareMozaic(3,k)*params.HashCuloareMozaic(3,k)-meanCul(3)*meanCul(3)));
                    if (i > 1)
                        if (PiesePuse(i-1,j)==k) continue;
                        end
                    end
                    if (j > 1)
                        if (PiesePuse(i,j-1)==k) continue; 
                        end
                    end
                    distanta = abs(params.HashCuloareMozaic(1,k)-meanCul(1))+abs(params.HashCuloareMozaic(2,k)-meanCul(2))+abs(params.HashCuloareMozaic(3,k)-meanCul(3));
                    if (distanta<min)
                        min=distanta;
                        indice = k;
                    end
                end    
                imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = params.pieseMozaic(:,:,:,indice);
                else
                bloc = params.imgReferintaRedimensionata((i-1)*H+1:i*H,(j-1)*W+1:j*W,:);
                meanCul(1) = mean(mean(bloc(:,:,1)));
                %alege indice
                min = 1000;
                indice = 1;
                for k = 1:N
                    if (i > 1)
                        if (PiesePuse(i-1,j)==k) continue;
                        end
                    end
                    if (j > 1)
                        if (PiesePuse(i,j-1)==k) continue; 
                        end
                    end
                   % distanta = sqrt(abs(params.HashCuloareMozaic(1,k)*params.HashCuloareMozaic(1,k)-meanCul(1)*meanCul(1)))+sqrt(abs(params.HashCuloareMozaic(2,k)*params.HashCuloareMozaic(2,k)-meanCul(2)*meanCul(2)))+sqrt(abs(params.HashCuloareMozaic(3,k)*params.HashCuloareMozaic(3,k)-meanCul(3)*meanCul(3)));
                    distanta = abs(params.HashGriMozaic(1,k)-meanCul(1));
                    if (distanta<min)
                        min=distanta;
                        indice = k;
                    end
                end
                imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = rgb2gray(params.pieseMozaic(:,:,:,indice));    
                end
                PiesePuse(i,j) = indice;
                nrPieseAdaugate = nrPieseAdaugate+1;
            %  fprintf('Construim mozaic ... %2.2f%% \n',100*nrPieseAdaugate/nrTotalPiese);
            end
        end
          
    otherwise
        printf('EROARE, optiune necunoscuta \n');
    
end
    
    
    
    
    
