function imgMozaic = adaugaPieseMozaicModAleator(params)
%
%tratati si cazul in care imaginea de referinta este gri (are numai un canal)
%variabila multiplicator are rolul de a asigura acoperirii plansii
multiplicator = 4;
imgMozaic = uint8(zeros(size(params.imgReferintaRedimensionata)));
[H,W,C,N] = size(params.pieseMozaic);
[h,w,c] = size(params.imgReferintaRedimensionata);
switch(params.criteriu)
    case 'aleator'
        %pune o piese aleatoare in mozaic, nu tine cont de nimic
        nrTotalPiese = params.numarPieseMozaicOrizontala * params.numarPieseMozaicVerticala;
        nrPieseAdaugate = 0;
         for z = 1:nrTotalPiese
                i =(rand()*(params.numarPieseMozaicVerticala-1))+1;
                j =(rand()*(params.numarPieseMozaicOrizontala-1))+1;
                %alege un indice aleator din cele N
                indice = randi(N);    
                imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = params.pieseMozaic(:,:,:,indice);
                nrPieseAdaugate = nrPieseAdaugate+1;
               % fprintf('Construim mozaic ... %2.2f%% \n',100*nrPieseAdaugate/nrTotalPiese);
         end
        
    case 'distantaCuloareMedie'
        %completati codul Matlab
        nrTotalPiese = params.numarPieseMozaicOrizontala * params.numarPieseMozaicVerticala*multiplicator;
        nrPieseAdaugate = 0;
%         for z = 1:nrTotalPiese
%                     i =(rand()*(params.numarPieseMozaicVerticala-1))+1;
%                     j =(rand()*(params.numarPieseMozaicOrizontala-1))+1;
%                     %bloc de inlocuit
%                     params.HashCuloareMozaic;
%                 if c==3
%                     bloc = params.imgReferintaRedimensionata(round((i-1)*H+1):round(i*H),round((j-1)*W+1):round(j*W),:);
%                     meanCul(1) = mean(mean(bloc(:,:,1)));
%                     meanCul(2) = mean(mean(bloc(:,:,2)));
%                     meanCul(3) = mean(mean(bloc(:,:,3)));
%                     %alege indice
%                     min = 1000;
%                     indice = 1;
%                     for k = 1:N
%                        % distanta = sqrt(abs(params.HashCuloareMozaic(1,k)*params.HashCuloareMozaic(1,k)-meanCul(1)*meanCul(1)))+sqrt(abs(params.HashCuloareMozaic(2,k)*params.HashCuloareMozaic(2,k)-meanCul(2)*meanCul(2)))+sqrt(abs(params.HashCuloareMozaic(3,k)*params.HashCuloareMozaic(3,k)-meanCul(3)*meanCul(3)));
%                         distanta = abs(params.HashCuloareMozaic(1,k)-meanCul(1))+abs(params.HashCuloareMozaic(2,k)-meanCul(2))+abs(params.HashCuloareMozaic(3,k)-meanCul(3));
%                         if (distanta<min)
%                             min=distanta;
%                             indice = k;
%                         end
%                     end    
%                     imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = params.pieseMozaic(:,:,:,indice);
%                 else
%                 bloc = params.imgReferintaRedimensionata(round((i-1)*H+1):round(i*H),round((j-1)*W+1):round(j*W),:);
%                 meanCul(1) = mean(mean(bloc(:,:,1)));
%                 %alege indice
%                 min = 1000;
%                 indice = 1;
%                 for k = 1:N
%                    % distanta = sqrt(abs(params.HashCuloareMozaic(1,k)*params.HashCuloareMozaic(1,k)-meanCul(1)*meanCul(1)))+sqrt(abs(params.HashCuloareMozaic(2,k)*params.HashCuloareMozaic(2,k)-meanCul(2)*meanCul(2)))+sqrt(abs(params.HashCuloareMozaic(3,k)*params.HashCuloareMozaic(3,k)-meanCul(3)*meanCul(3)));
%                     distanta = abs(params.HashGriMozaic(1,k)-meanCul(1));
%                     if (distanta<min)
%                         min=distanta;
%                         indice = k;
%                     end
%                 end    
%                 imgMozaic(round((i-1)*H+1):round(i*H),round((j-1)*W+1):round(j*W),:) = rgb2gray(params.pieseMozaic(:,:,:,indice));    
%                 end
%                     nrPieseAdaugate = nrPieseAdaugate+1;
%                 %  fprintf('Construim mozaic ... %2.2f%% \n',100*nrPieseAdaugate/nrTotalPiese);
%         end
        for x = 0:params.numarPieseMozaicVerticala*2-3
             for y = 0:params.numarPieseMozaicOrizontala*2-3
                    i =round((rand()*H/2))+1;
                    j =round((rand()*W/2))+1;
                    if x == 0
                      x_inceput = 1;
                    else if x > params.numarPieseMozaicVerticala*2-4
                      x_inceput = (params.numarPieseMozaicVerticala*2-3) * H / 2+H/2;
                    else
                      x_inceput = x * H / 2 +i;
                        end
                    end
                   if y == 0
                      y_inceput = 1;
                   else if y > params.numarPieseMozaicOrizontala*2-4
                      y_inceput = y * W / 2+W/2;
                    else
                      y_inceput = y * W / 2 +j;
                       end
                   end
                    %bloc de inlocuit
                    params.HashCuloareMozaic;
                if c==3
                    bloc = params.imgReferintaRedimensionata(x_inceput:x_inceput+H-1,y_inceput:y_inceput+W-1,:);
                    meanCul(1) = mean(mean(bloc(:,:,1)));
                    meanCul(2) = mean(mean(bloc(:,:,2)));
                    meanCul(3) = mean(mean(bloc(:,:,3)));
                    %alege indice
                    min = 1000;
                    indice = 1;
                    for k = 1:N
                       % distanta = sqrt(abs(params.HashCuloareMozaic(1,k)*params.HashCuloareMozaic(1,k)-meanCul(1)*meanCul(1)))+sqrt(abs(params.HashCuloareMozaic(2,k)*params.HashCuloareMozaic(2,k)-meanCul(2)*meanCul(2)))+sqrt(abs(params.HashCuloareMozaic(3,k)*params.HashCuloareMozaic(3,k)-meanCul(3)*meanCul(3)));
                        distanta = abs(params.HashCuloareMozaic(1,k)-meanCul(1))+abs(params.HashCuloareMozaic(2,k)-meanCul(2))+abs(params.HashCuloareMozaic(3,k)-meanCul(3));
                        if (distanta<min)
                            min=distanta;
                            indice = k;
                        end
                    end    
                    imgMozaic(x_inceput:x_inceput+H-1,y_inceput:y_inceput+W-1,:) = params.pieseMozaic(:,:,:,indice);
                else
                bloc = params.imgReferintaRedimensionata(x_inceput:x_inceput+H-1,y_inceput:y_inceput+W-1,:);
                meanCul(1) = mean(mean(bloc(:,:,1)));
                %alege indice
                min = 1000;
                indice = 1;
                for k = 1:N
                   % distanta = sqrt(abs(params.HashCuloareMozaic(1,k)*params.HashCuloareMozaic(1,k)-meanCul(1)*meanCul(1)))+sqrt(abs(params.HashCuloareMozaic(2,k)*params.HashCuloareMozaic(2,k)-meanCul(2)*meanCul(2)))+sqrt(abs(params.HashCuloareMozaic(3,k)*params.HashCuloareMozaic(3,k)-meanCul(3)*meanCul(3)));
                    distanta = abs(params.HashGriMozaic(1,k)-meanCul(1));
                    if (distanta<min)
                        min=distanta;
                        indice = k;
                    end
                end    
                imgMozaic(x_inceput:x_inceput+H-1,y_inceput:y_inceput+W-1,:) = rgb2gray(params.pieseMozaic(:,:,:,indice));    
                end
                    nrPieseAdaugate = nrPieseAdaugate+1;
                %  fprintf('Construim mozaic ... %2.2f%% \n',100*nrPieseAdaugate/nrTotalPiese);
             end
    end
    otherwise
        printf('EROARE, optiune necunoscuta \n');
    
end
    
    
    
    
    
