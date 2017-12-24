function imgMozaic = adaugaPieseMozaicPeCaroiajHexagonal( params )
%
%tratati si cazul in care imaginea de referinta este gri (are numai un canal)

imgMozaic = uint8(zeros(size(params.imgReferintaRedimensionataHexagonal)));
[H,W,C,N] = size(params.pieseMozaic);
[h,w,c] = size(params.imgReferintaRedimensionata);
PiesePuse = zeros( 2*round(params.numarPieseMozaicVerticala+1),2*round(params.numarPieseMozaicOrizontala+1));
switch(params.criteriu)
    case 'aleator'
        %pune o piese aleatoare in mozaic, nu tine cont de nimic
        nrTotalPiese = params.numarPieseMozaicOrizontala * params.numarPieseMozaicVerticala;
        nrPieseAdaugate = 0;
        H = H / 2;
        W = W + 12;
        for i =1:params.numarPieseMozaicVerticala*2
            for j=1:params.numarPieseMozaicOrizontala
                %alege un indice aleator din cele N
                if ( mod(i,2) == 1)
                    push = 25;
                else
                    push = 0;
                end
                indice = randi(N);
                for linie = 1:14
                    for coloana = 14:-1:15-linie
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=params.pieseMozaic(linie,coloana,1,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                 for linie = 15:28
                    for coloana = linie-14:14
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=params.pieseMozaic(linie,coloana,1,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                for linie = 1:14
                    for coloana = 26:26+linie
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=params.pieseMozaic(linie,coloana,1,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                for linie = 15:28
                    for coloana = 26:55-linie
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=params.pieseMozaic(linie,coloana,1,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                  imgMozaic((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,1)=params.pieseMozaic(1:28,15:26,1,indice);
                  imgMozaic((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,2)=params.pieseMozaic(1:28,15:26,2,indice);
                  imgMozaic((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,3)=params.pieseMozaic(1:28,15:26,3,indice);
                nrPieseAdaugate = nrPieseAdaugate+1;
               % fprintf('Construim mozaic ... %2.2f%% \n',100*nrPieseAdaugate/nrTotalPiese);
            end
        end
        
    case 'distantaCuloareMedie'
        %completati codul Matlab
        nrTotalPiese = params.numarPieseMozaicOrizontala * params.numarPieseMozaicVerticala;
        nrPieseAdaugate = 0;
        H = H / 2;
        W = W + 12;
       % bloc = zeros(50,50,4);
        for i =1:params.numarPieseMozaicVerticalaHexagonal*2-1
            for j=1:params.numarPieseMozaicOrizontala
                %alege un indice aleator din cele N
                if ( mod(i,2) == 1)
                    push = 25;
                else
                    push = 0;
                end
                if c==3
                    % Construire bloc de inlocuit
                for linie = 1:14
                    for coloana = 14:-1:15-linie
                        bloc(linie,coloana,1) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,1);
                        bloc(linie,coloana,2) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,2);
                        bloc(linie,coloana,3) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,3);
                    end
                end
                 for linie = 15:28
                    for coloana = linie-14:14
                        bloc(linie,coloana,1) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,1);
                        bloc(linie,coloana,2) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,2);
                        bloc(linie,coloana,3) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,3);
                    end
                end
                for linie = 1:14
                    for coloana = 26:26+linie
                        bloc(linie,coloana,1) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,1);
                        bloc(linie,coloana,2) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,2);
                        bloc(linie,coloana,3) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,3);
                    end
                end
                for linie = 15:28
                    for coloana = 26:55-linie
                        bloc(linie,coloana,1) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,1);
                        bloc(linie,coloana,2) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,2);
                        bloc(linie,coloana,3) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,3);
                    end
                end
                  bloc(1:28,15:26,1) = params.imgReferintaRedimensionataHexagonal((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,1);
                  bloc(1:28,15:26,2) = params.imgReferintaRedimensionataHexagonal((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,2);
                  bloc(1:28,15:26,3) = params.imgReferintaRedimensionataHexagonal((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,3);
                 % medie mozaic
                  meanCul(1) = mean(mean(bloc(:,:,1)));
                  meanCul(2) = mean(mean(bloc(:,:,2)));
                  meanCul(3) = mean(mean(bloc(:,:,3)));
                % alegere piesa
                min = 100000;
                indice = 1;
                for k = 1:N
                   % distanta = sqrt(abs(params.HashCuloareMozaic(1,k)*params.HashCuloareMozaic(1,k)-meanCul(1)*meanCul(1)))+sqrt(abs(params.HashCuloareMozaic(2,k)*params.HashCuloareMozaic(2,k)-meanCul(2)*meanCul(2)))+sqrt(abs(params.HashCuloareMozaic(3,k)*params.HashCuloareMozaic(3,k)-meanCul(3)*meanCul(3)));
                    if (i > 2)
                        if (PiesePuse(i-2,j)==k) continue;
                        end
                    end
                    if (i > 1)
                        if (j>1)
                            if (PiesePuse(i-1,j-1)==k)
                                 continue;
                            end 
                        end
                        if (PiesePuse(i-1,j)==k)
                            continue;
                        end
                        if (j<params.numarPieseMozaicOrizontala)
                          if (PiesePuse(i-1,j+1)==k)
                              continue;
                          end
                        end
                    end
                    distanta = abs(params.HashCuloareMozaicHexagonal(1,k)-meanCul(1))+abs(params.HashCuloareMozaicHexagonal(2,k)-meanCul(2))+abs(params.HashCuloareMozaicHexagonal(3,k)-meanCul(3));
                    if (distanta<min)
                        min=distanta;
                        indice = k;
                    end
                end
                PiesePuse(i,j) = indice;
                if ( mod(i,2) == 1)
                    push = 25;
                else
                    push = 0;
                end
                for linie = 1:14
                    for coloana = 14:-1:15-linie
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=params.pieseMozaic(linie,coloana,1,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                 for linie = 15:28
                    for coloana = linie-14:14
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=params.pieseMozaic(linie,coloana,1,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                for linie = 1:14
                    for coloana = 26:26+linie
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=params.pieseMozaic(linie,coloana,1,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                for linie = 15:28
                    for coloana = 26:55-linie
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=params.pieseMozaic(linie,coloana,1,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                  imgMozaic((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,1)=params.pieseMozaic(1:28,15:26,1,indice);
                  imgMozaic((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,2)=params.pieseMozaic(1:28,15:26,2,indice);
                  imgMozaic((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,3)=params.pieseMozaic(1:28,15:26,3,indice);
                nrPieseAdaugate = nrPieseAdaugate+1;
               % fprintf('Construim mozaic ... %2.2f%% \n',100*nrPieseAdaugate/nrTotalPiese);
                else
                       % Construire bloc de inlocuit
                for linie = 1:14
                    for coloana = 14:-1:15-linie
                        bloc(linie,coloana,1) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,1);
                       % bloc(linie,coloana,2) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,2);
                      %  bloc(linie,coloana,3) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,3);
                    end
                end
                 for linie = 15:28
                    for coloana = linie-14:14
                        bloc(linie,coloana,1) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,1);
                      %  bloc(linie,coloana,2) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,2);
                      %  bloc(linie,coloana,3) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,3);
                    end
                end
                for linie = 1:14
                    for coloana = 26:26+linie
                        bloc(linie,coloana,1) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,1);
                       % bloc(linie,coloana,2) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,2);
                       % bloc(linie,coloana,3) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,3);
                    end
                end
                for linie = 15:28
                    for coloana = 26:55-linie
                        bloc(linie,coloana,1) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,1);
                       % bloc(linie,coloana,2) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,2);
                       % bloc(linie,coloana,3) = params.imgReferintaRedimensionataHexagonal((i-1)*H+linie,(j-1)*W+coloana+push,3);
                    end
                end
                  bloc(1:28,15:26,1) = params.imgReferintaRedimensionataHexagonal((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,1);
                 % bloc(1:28,15:26,2) = params.imgReferintaRedimensionataHexagonal((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,2);
                 % bloc(1:28,15:26,3) = params.imgReferintaRedimensionataHexagonal((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,3);
                 % medie mozaic
                  meanCul(1) = mean(mean(bloc(:,:,1)));
                  %meanCul(2) = mean(mean(bloc(:,:,2)));
                 % meanCul(3) = mean(mean(bloc(:,:,3)));
                % alegere piesa
                min = 100000;
                indice = 1;
                for k = 1:N
                   % distanta = sqrt(abs(params.HashCuloareMozaic(1,k)*params.HashCuloareMozaic(1,k)-meanCul(1)*meanCul(1)))+sqrt(abs(params.HashCuloareMozaic(2,k)*params.HashCuloareMozaic(2,k)-meanCul(2)*meanCul(2)))+sqrt(abs(params.HashCuloareMozaic(3,k)*params.HashCuloareMozaic(3,k)-meanCul(3)*meanCul(3)));
                    if (i > 2)
                        if (PiesePuse(i-2,j)==k) continue;
                        end
                    end
                    if (i > 1)
                        if (j>1)
                            if (PiesePuse(i-1,j-1)==k)
                                 continue;
                            end 
                        end
                        if (PiesePuse(i-1,j)==k)
                            continue;
                        end
                        if (j<params.numarPieseMozaicOrizontala)
                          if (PiesePuse(i-1,j+1)==k)
                              continue;
                          end
                        end
                    end
                    distanta = abs(params.HashCuloareMozaicHexagonal(1,k)-meanCul(1));
                    if (distanta<min)
                        min=distanta;
                        indice = k;
                    end
                end
                PiesePuse(i,j) = indice;
                if ( mod(i,2) == 1)
                    push = 25;
                else
                    push = 0;
                end
                for linie = 1:14
                    for coloana = 14:-1:15-linie
                       imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=rgb2gray(params.pieseMozaic(linie,coloana,:,indice));
                        %imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                       % imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                 for linie = 15:28
                    for coloana = linie-14:14
                       imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=rgb2gray(params.pieseMozaic(linie,coloana,:,indice));
                       % imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                       % imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                for linie = 1:14
                    for coloana = 26:26+linie
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=rgb2gray(params.pieseMozaic(linie,coloana,:,indice));
                       % imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                       % imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                for linie = 15:28
                    for coloana = 26:55-linie
                        imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,1)=rgb2gray(params.pieseMozaic(linie,coloana,:,indice));
                       % imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,2)=params.pieseMozaic(linie,coloana,2,indice);
                       % imgMozaic((i-1)*H+linie,(j-1)*W+coloana+push,3)=params.pieseMozaic(linie,coloana,3,indice);
                    end
                end
                  imgMozaic((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,1)=rgb2gray(params.pieseMozaic(1:28,15:26,:,indice));
                %  imgMozaic((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,2)=params.pieseMozaic(1:28,15:26,2,indice);
                %  imgMozaic((i-1)*H+1:(i-1)*H+28,(j-1)*W+15+push:(j-1)*W+26+push,3)=params.pieseMozaic(1:28,15:26,3,indice);
                nrPieseAdaugate = nrPieseAdaugate+1; 
                end  
            end
        end
        
%         nrTotalPiese = params.numarPieseMozaicOrizontala * params.numarPieseMozaicVerticala;
%         nrPieseAdaugate = 0;
%         for i =1:params.numarPieseMozaicVerticala
%             for j=1:params.numarPieseMozaicOrizontala
%                 %bloc de inlocuit
%                 params.HashCuloareMozaic;
%                 params.HashGriMozaic;
%                 indice =0;
%                 if c==3
%                 bloc = params.imgReferintaRedimensionata((i-1)*H+1:i*H,(j-1)*W+1:j*W,:);
%                 meanCul(1) = mean(mean(bloc(:,:,1)));
%                 meanCul(2) = mean(mean(bloc(:,:,2)));
%                 meanCul(3) = mean(mean(bloc(:,:,3)));
%                 %alege indice
%                 min = 1000;
%                 indice = 1;
%                 for k = 1:N
%                    % distanta = sqrt(abs(params.HashCuloareMozaic(1,k)*params.HashCuloareMozaic(1,k)-meanCul(1)*meanCul(1)))+sqrt(abs(params.HashCuloareMozaic(2,k)*params.HashCuloareMozaic(2,k)-meanCul(2)*meanCul(2)))+sqrt(abs(params.HashCuloareMozaic(3,k)*params.HashCuloareMozaic(3,k)-meanCul(3)*meanCul(3)));
%                     if (i > 1)
%                         if (PiesePuse(i-1,j)==k) continue;
%                         end
%                     end
%                     if (j > 1)
%                         if (PiesePuse(i,j-1)==k) continue; 
%                         end
%                     end
%                     distanta = abs(params.HashCuloareMozaic(1,k)-meanCul(1))+abs(params.HashCuloareMozaic(2,k)-meanCul(2))+abs(params.HashCuloareMozaic(3,k)-meanCul(3));
%                     if (distanta<min)
%                         min=distanta;
%                         indice = k;
%                     end
%                 end    
%                 imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = params.pieseMozaic(:,:,:,indice);
%                 else
%                 bloc = params.imgReferintaRedimensionata((i-1)*H+1:i*H,(j-1)*W+1:j*W,:);
%                 meanCul(1) = mean(mean(bloc(:,:,1)));
%                 %alege indice
%                 min = 1000;
%                 indice = 1;
%                 for k = 1:N
%                     if (i > 1)
%                         if (PiesePuse(i-1,j)==k) continue;
%                         end
%                     end
%                     if (j > 1)
%                         if (PiesePuse(i,j-1)==k) continue; 
%                         end
%                     end
%                    % distanta = sqrt(abs(params.HashCuloareMozaic(1,k)*params.HashCuloareMozaic(1,k)-meanCul(1)*meanCul(1)))+sqrt(abs(params.HashCuloareMozaic(2,k)*params.HashCuloareMozaic(2,k)-meanCul(2)*meanCul(2)))+sqrt(abs(params.HashCuloareMozaic(3,k)*params.HashCuloareMozaic(3,k)-meanCul(3)*meanCul(3)));
%                     distanta = abs(params.HashGriMozaic(1,k)-meanCul(1));
%                     if (distanta<min)
%                         min=distanta;
%                         indice = k;
%                     end
%                 end
%                 imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = rgb2gray(params.pieseMozaic(:,:,:,indice));    
%                 end
%                 PiesePuse(i,j) = indice;
%                 nrPieseAdaugate = nrPieseAdaugate+1;
%             %  fprintf('Construim mozaic ... %2.2f%% \n',100*nrPieseAdaugate/nrTotalPiese);
%             end
%         end
%           
%     otherwise
%         printf('EROARE, optiune necunoscuta \n');
%     
end