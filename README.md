<img src='![logo](https://github.com/user-attachments/assets/2fb5132e-5c91-49af-839a-59a3cfc1b60b)
' alt='logo' width="300" height="300">



#UAS Desain Pemrograman Mobile TI4A
Anggota Kelompok :
* Han Lie (2111500077)
* Martua Denny Natalius Sitanggang (2311500002)
* Rizky Oktoreza (2311500001)
* Harmin Abdul Maryanto (2311500099)

Aplikasi pengiriman pesan rahasia enkripsi & dekripsi hill cipher
* cek kondisi dan jumlah kalimat yang akan di enkripsi
* masukkan kalimat/pesan yang akan di enkripsi
* pilih metode pengujian enkripsi, matriks kunci 3x3 atau ordo 2x2
* masukkan kata-kata per 3 atau 2 huruf yang akan di enkripsi yang akan di enkripsi
* masukkan matriks kunci
* lalu enkripsi berdasarkan jumlah kata dan enkripsi menggunakan matriks kunci yang digunakan

LOGIC PEMROGRAMAN
1. User memasukkan kata-kata,kalimat, atau hasil enkripsi di form input.

2. Kalimat di deteksi berdasarkan jumlah huruf dan akan dipisahkan per 2 atau 3 huruf sesuai hasil deteksi jumlah,
   dan spasi di identifikasi sebagai pemisah antar kata.

	H A | L O |SPASI| H A N | L I E

3. Kalimat yang sudah diubah dalam bentuk yang terpisah-pisah sesuai ordo (2x2 atau 3x3) akan dikonversi menjadi dalam bentuk
   angka sesuai abjad A-Z berdasarkan index 0-25 (26 Abjad).

	7 0 | 11 14
	H A | L  O

	7 0 13 | 11 8 4
	H A N  | L  I E

4. Angka yang dikonversi akan dimasukkan ke dalam fungsi perhitungan Ketika tombol enkripsi/dekripsi ditekan,
   menggunakan matriks kunci default yang sudah ada.

   (Matriks kunci x Konversi) modulo 26

5. Hasil enkripsi/dekripsi dikonversi Kembali menjadi dalam bentuk huruf yang akan ditampilkan di form output.
