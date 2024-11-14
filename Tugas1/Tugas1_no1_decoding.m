% Kamus Awal
kamus = containers.Map('KeyType', 'double', 'ValueType', 'char');
kamus(1) = 'a';
kamus(2) = 'b';
kamus(3) = 'c';
kamus(4) = 'o';
kamus(5) = 'w';


% Data terkompresi
data_terkompresi = [5, 1, 2, 2, 1, 3, 6, 8, 10, 5, 4, 4, 11, 16];

% Inisialisasi variabel untuk output hasil dekompresi
hasil_dekompresi = '';

% Mulai proses decoding
currentIndex = 6; % Awal indeks baru untuk kamus

% Dekode indeks pertama di data terkompresi
indeks_pertama = data_terkompresi(1);
hasil_dekompresi = strcat(hasil_dekompresi, kamus(indeks_pertama));
previous_string = kamus(indeks_pertama);

% Looping untuk setiap indeks setelah indeks pertama
for i = 2:length(data_terkompresi)
    indeks = data_terkompresi(i);
    
    if isKey(kamus, indeks)
        % Jika indeks ada di kamus
        current_string = kamus(indeks);
    else
        % Jika indeks belum ada di kamus
        current_string = strcat(previous_string, previous_string(1));
    end
    
    % Tambahkan string ke hasil dekompresi
    hasil_dekompresi = strcat(hasil_dekompresi, current_string);
    
    % Tambahkan entri baru ke kamus
    new_entry = strcat(previous_string, current_string(1));
    kamus(currentIndex) = new_entry;
    currentIndex = currentIndex + 1;
    
    % Update previous_string
    previous_string = current_string;
end

% Tampilkan hasil dekompresi
disp('Hasil Dekompresi:');
disp(hasil_dekompresi);

% Tampilkan Kamus Akhir
disp('Kamus Akhir:');
keys = kamus.keys;      % Mendapatkan daftar kunci
values = kamus.values;  % Mendapatkan daftar nilai

for i = 1:length(keys)
    fprintf('%d -> %s\n', keys{i}, values{i});
end