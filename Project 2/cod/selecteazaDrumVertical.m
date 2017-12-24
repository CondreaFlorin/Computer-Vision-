function d = selecteazaDrumVertical(E,metodaSelectareDrum)
%selecteaza drumul vertical ce minimizeaza functia cost calculate pe baza lui E
%
%input: E - energia la fiecare pixel calculata pe baza gradientului
%       metodaSelectareDrum - specifica metoda aleasa pentru selectarea drumului. Valori posibile:
%                           'aleator' - alege un drum aleator
%                           'greedy' - alege un drum utilizand metoda Greedy
%                           'programareDinamica' - alege un drum folosind metoda Programarii Dinamice
%
%output: d - drumul vertical ales

d = zeros(size(E,1),2);

switch metodaSelectareDrum
    case 'aleator'
        %pentru linia 1 alegem primul pixel in mod aleator
        linia = 1;
        %coloana o alegem intre 1 si size(E,2)
        coloana = randi(size(E,2));
        %punem in d linia si coloana coresponzatoare pixelului
        d(1,:) = [linia coloana];
        for i = 2:size(d,1)
            %alege urmatorul pixel pe baza vecinilor
            %linia este i
            linia = i;
            %coloana depinde de coloana pixelului anterior
            if d(i-1,2) == 1%pixelul este localizat la marginea din stanga
                %doua optiuni
                optiune = randi(2)-1;%genereaza 0 sau 1 cu probabilitati egale 
            elseif d(i-1,2) == size(E,2)%pixelul este la marginea din dreapta
                %doua optiuni
                optiune = randi(2) - 2; %genereaza -1 sau 0
            else
                optiune = randi(3)-2; % genereaza -1, 0 sau 1
            end
            coloana = d(i-1,2) + optiune;%adun -1 sau 0 sau 1: 
                                         % merg la stanga, dreapta sau stau pe loc
            d(i,:) = [linia coloana];
        end
    case 'greedy'
        %pentru linia 1 alegem primul pixel in mod aleator
        linie = 1;
        %coloana o alegem intre 1 si size(E,2)
        minim = E(1,1);
        ind = 1;
        for i = 2:size(E,2)
            if E(1,i)<minim
               ind = i;
               minim = E(1,i);
            end
        end
        coloana = ind;
        %punem in d linia si coloana coresponzatoare pixelului
        d(1,:) = [linie coloana];
        for i = 2:size(d,1)
            %alege urmatorul pixel pe baza vecinilor
            %linia este i
            linie = i;
            coloana = d(i-1,2);
            %coloana depinde de coloana pixelului anterior
            if coloana == 1%pixelul este localizat la marginea din stanga
                %doua optiuni
                minim = E(linie,coloana);
                optiune = 0;
                if (E(linie,coloana+1)<minim)
                    minim = E(linie,coloana+1);
                    optiune = 1;
                end
            elseif coloana == size(E,2)%pixelul este la marginea din dreapta
                %doua optiuni
                minim = E(linie,coloana);
                optiune = 0;
                if (E(linie,coloana-1)<minim)
                    minim = E(linie,coloana-1);
                    optiune = -1;
                end
            else
                minim = E(linie,coloana);
                optiune = 0;
                if (E(linie,coloana-1)<minim)
                    minim = E(linie,coloana-1);
                    optiune = -1;
                end
                 if (E(linie,coloana+1)<minim)
                    minim = E(linie,coloana+1);
                    optiune = 1;
                end
            end
            coloana = coloana + optiune;%adun -1 sau 0 sau 1: 
                                         % merg la stanga, dreapta sau stau pe loc
            d(i,:) = [linie coloana];
        end      
    case 'programareDinamica'
        CostDrum(1,:)=E(1,:);
        for i=2:size(E,1)
            for j=1:size(E,2)
                if j==1
                   CostDrum(i,j) = min([CostDrum(i-1,j) CostDrum(i-1,j+1)]);
                elseif j == size(E,2)
                   CostDrum(i,j) = min([CostDrum(i-1,j-1) CostDrum(i-1,j)]);
                else
                   CostDrum(i,j) = min([CostDrum(i-1,j) CostDrum(i-1,j-1) CostDrum(i-1,j+1)]);
                end
                CostDrum(i,j) = CostDrum(i,j) + E(i,j);
            end
        end
        minim = CostDrum(size(E,1),1);
        ind = 1;
        for i = 2:size(CostDrum,2)
            if CostDrum(size(E,1),i)<minim
               ind = i;
               minim = CostDrum(size(E,1),i);
            end
        end
        d(size(CostDrum,1),:) = [size(CostDrum,1) ind];
        for i = size(CostDrum,1)-1:-1:1
            %alege urmatorul pixel pe baza vecinilor
            %linia este i
            linie = i;
            coloana = d(linie+1,2);
            %coloana depinde de coloana pixelului anterior
            if coloana == 1
               if CostDrum(linie+1,coloana) == (CostDrum(linie,coloana) + E(linie+1,coloana))
                   d(linie,:) = [ linie coloana];                  
               else
                   d(linie,:) = [ linie coloana+1];
               end
            elseif coloana == size(CostDrum,2)%pixelul este la marginea din dreapta
               if CostDrum(linie+1,coloana) == (CostDrum(linie,coloana) + E(linie+1,coloana))
                   d(linie,:) = [ linie coloana];                  
               else
                   d(linie,:) = [ linie coloana-1];
               end
            else
                if CostDrum(linie+1,coloana) == (CostDrum(linie,coloana) + E(linie+1,coloana))
                   d(linie,:) = [ linie coloana];                  
                elseif CostDrum(linie+1,coloana) == (CostDrum(linie,coloana-1) + E(linie+1,coloana))
                   d(linie,:) = [ linie coloana-1];
                else
                   d(linie,:) = [ linie coloana+1];   
               end
            end
        end      
    otherwise
        error('Optiune pentru metodaSelectareDrum invalida');
end

end