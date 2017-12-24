function params = incarcaPieseMozaic(params)
%citeste toate cele N piese folosite la mozaic din directorul corespunzator
%toate cele N imagini au aceeasi dimensiune H x W x C, unde:
%H = inaltime, W = latime, C = nr canale (C=1  gri, C=3 color)
%functia intoarce pieseMozaic = matrice H x W x C x N in params
%pieseMoziac(:,:,:,i) reprezinta piese numarul i 

fprintf('Incarcam piesele pentru mozaic din director \n');
%completati codul Matlab
pieseMozaicHexagonal = zeros(28,40,3,500);
load('C:\Users\Admin\Downloads\cifar-10-matlab\cifar-10-batches-mat\data_batch_1.mat');
i=0;
for k = 1:10000
   % pieseMozaic(:,:,:,i) = imread(strcat(char('C:\Users\Admin\Desktop\Proiect1\Proiect1\data\colectie\'),int2str(i),'.',char(params.tipImagine)));
   if (labels(k,1)==6)
   i=i+1;
   for linie = 0:31
       for coloana = 1:32
            pieseMozaic(linie+1,coloana,1,i) = data(k,coloana+linie*32);
            pieseMozaic(linie+1,coloana,2,i) = data(k,coloana+linie*32+1024);
            pieseMozaic(linie+1,coloana,3,i) = data(k,coloana+linie*32+2048);
       end
   end
  if ( params.modAranjare == 'hexagon')
   for linie = 1:14
       for coloana = 14:-1:15-linie
            pieseMozaicHexagonal(linie,coloana,1,i)=pieseMozaic(linie,coloana,1,i);
            pieseMozaicHexagonal(linie,coloana,2,i)=pieseMozaic(linie,coloana,2,i);
            pieseMozaicHexagonal(linie,coloana,3,i)=pieseMozaic(linie,coloana,3,i);
        end
    end
    for linie = 15:28
        for coloana = linie-14:14
             pieseMozaicHexagonal(linie,coloana,1,i)=pieseMozaic(linie,coloana,1,i);
            pieseMozaicHexagonal(linie,coloana,2,i)=pieseMozaic(linie,coloana,2,i);
            pieseMozaicHexagonal(linie,coloana,3,i)=pieseMozaic(linie,coloana,3,i);
        end
    end
    for linie = 1:14
        for coloana = 26:26+linie
             pieseMozaicHexagonal(linie,coloana,1,i)=pieseMozaic(linie,coloana,1,i);
            pieseMozaicHexagonal(linie,coloana,2,i)=pieseMozaic(linie,coloana,2,i);
            pieseMozaicHexagonal(linie,coloana,3,i)=pieseMozaic(linie,coloana,3,i);
        end
    end
    for linie = 15:28
        for coloana = 26:55-linie
            pieseMozaicHexagonal(linie,coloana,1,i)=pieseMozaic(linie,coloana,1,i);
            pieseMozaicHexagonal(linie,coloana,2,i)=pieseMozaic(linie,coloana,2,i);
            pieseMozaicHexagonal(linie,coloana,3,i)=pieseMozaic(linie,coloana,3,i);
        end
    end
    pieseMozaicHexagonal(1:28,15:26,1,i)=pieseMozaic(1:28,15:26,1,i);
    pieseMozaicHexagonal(1:28,15:26,2,i)=pieseMozaic(1:28,15:26,2,i);
    pieseMozaicHexagonal(1:28,15:26,3,i)=pieseMozaic(1:28,15:26,3,i);
    HashCuloareMozaicHexagonal(1,i) = mean(mean(pieseMozaicHexagonal(:,:,1,i)));
    HashCuloareMozaicHexagonal(2,i) = mean(mean(pieseMozaicHexagonal(:,:,2,i)));
    HashCuloareMozaicHexagonal(3,i) = mean(mean(pieseMozaicHexagonal(:,:,3,i)));
    HashGriMozaicHexagonal(i) = (HashCuloareMozaicHexagonal(3,i)+HashCuloareMozaicHexagonal(2,i)+HashCuloareMozaicHexagonal(1,i))/3;
  end
    HashCuloareMozaic(1,i) = mean(mean(pieseMozaic(:,:,1,i)));
    HashCuloareMozaic(2,i) = mean(mean(pieseMozaic(:,:,2,i)));
    HashCuloareMozaic(3,i) = mean(mean(pieseMozaic(:,:,3,i)));
    HashGriMozaic(i) = (HashCuloareMozaic(3,i)+HashCuloareMozaic(2,i)+HashCuloareMozaic(1,i))/3;
   end
end

if params.afiseazaPieseMozaic
    %afiseaza primele 100 de piese ale mozaicului
    figure,
    title('Primele 100 de piese ale mozaicului sunt:');
    idxImg = 0;
    for i = 1:10
        for j = 1:10
            idxImg = idxImg + 1;
            subplot(10,10,idxImg);
            imshow(pieseMozaic(:,:,:,idxImg));
        end
    end
    drawnow;
    pause(2);
end
i
params.pieseMozaic = pieseMozaic;
params.HashGriMozaic = HashGriMozaic;
params.HashCuloareMozaic = HashCuloareMozaic;
if ( params.modAranjare == 'hexagon')
params.pieseMozaicHexagonal = pieseMozaicHexagonal;
params.HashGriMozaicHexagonal = HashGriMozaicHexagonal;
params.HashCuloareMozaicHexagonal = HashCuloareMozaicHexagonal;
end
