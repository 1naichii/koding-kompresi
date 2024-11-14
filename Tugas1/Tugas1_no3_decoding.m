% Kamus Awal
kamus = containers.Map('KeyType', 'double', 'ValueType', 'char');
kamus(1) = 'a';
kamus(2) = 'b';
kamus(3) = 'h';
kamus(4) = 'i';
kamus(5) = 's';
kamus(6) = 't';

% Data terkompresi
data_terkompresi = [6, 3, 4, 5, 2, 3, 1, 6, 2, 9, 11, 16, 12, 14, 4, 20, 10, 8, 23, 13];

% Inisialisasi variabel untuk output hasil dekompresi
hasil_dekompresi = '';

% Mulai proses decoding
currentIndex = 7; % Awal indeks baru untuk kamus

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