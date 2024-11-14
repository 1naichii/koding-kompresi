% Kamus Awal
kamus = containers.Map('KeyType', 'double', 'ValueType', 'char');
kamus(1) = '$';
kamus(2) = 'a';
kamus(3) = 'r';
kamus(4) = 's';
kamus(5) = 'y';


% Data terkompresi
data_terkompresi = [2, 1, 3, 2, 5, 1, 4, 2, 3, 8, 10, 5, 2, 4, 12, 15];

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