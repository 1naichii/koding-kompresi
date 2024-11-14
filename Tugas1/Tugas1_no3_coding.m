% String input
inputString = 'thisbhatbisbhisbhatbitbisbhisbhat';

% Inisialisasi kamus dengan karakter unik yang ada pada input
dictionary = containers.Map();  % Menggunakan struktur Map untuk kamus
index = 1;

% Membuat kamus awal dengan karakter unik
uniqueChars = unique(inputString);
for i = 1:length(uniqueChars)
    dictionary(uniqueChars(i)) = index;
    index = index + 1;
end

% Variabel untuk menyimpan hasil kompresi
compressedData = [];
currentStr = '';

% Proses kompresi menggunakan dictionary technique
for i = 1:length(inputString)
    currentChar = inputString(i);
    if isKey(dictionary, [currentStr currentChar])
        % Jika substring sudah ada di kamus, perbarui currentStr
        currentStr = [currentStr currentChar];
    else
        % Jika substring tidak ada di kamus, simpan indeksnya di hasil kompresi
        compressedData = [compressedData, dictionary(currentStr)];
        
        % Tambahkan substring baru ke kamus
        dictionary([currentStr currentChar]) = index;
        index = index + 1;
        
        % Reset currentStr menjadi karakter saat ini
        currentStr = currentChar;
    end
end

% Tambahkan indeks terakhir ke hasil kompresi
compressedData = [compressedData, dictionary(currentStr)];

% Menampilkan hasil
disp('Data Asli:');
disp(inputString);
disp('Data Terkompresi (Indeks Kamus):');
disp(compressedData);

% Menampilkan Kamus Akhir
disp('Kamus Akhir:');
keys = dictionary.keys;
values = dictionary.values;
for i = 1:length(keys)
    fprintf("'%s' -> %d\n", keys{i}, values{i});
end
