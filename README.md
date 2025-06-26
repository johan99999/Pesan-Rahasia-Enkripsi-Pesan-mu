![logo](https://github.com/user-attachments/assets/9f743a49-815b-4dbb-bf91-0c09e50cd28b)




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
* masukkan kata-kata per 3 atau 2 huruf yang akan di enkripsi yang akan di enkripsi (dominan akan dilakukan ordo 3x3 dahulu jika kalimat yang panjang, baru 2x2 tergantung sisa huruf)
* masukkan matriks kunci
* lalu enkripsi berdasarkan jumlah kata dan enkripsi menggunakan matriks kunci yang digunakan

LOGIC PEMROGRAMAN
1. User memasukkan kata-kata,kalimat, atau hasil enkripsi di form input.

2. Kalimat di deteksi berdasarkan jumlah huruf dan akan dipisahkan per 2 atau 3 huruf sesuai hasil deteksi.

	* SEMANGAT BELAJAR UNTUK MASA DEPAN
	* SEMANGATBELAJARUNTUKMASADEPAN
	* SEM|ANG|ATB|ELA|JAR|UNT|UKM|ASA|DEP|AN
   	

4. Kalimat yang sudah diubah dalam bentuk yang terpisah-pisah sesuai ordo (2x2 atau 3x3) akan dikonversi menjadi dalam bentuk
   angka sesuai abjad A-Z berdasarkan index 0-25 (26 Abjad).

   	* SEM|ANG|ATB|ELA|JAR|UNT|UKM|ASA|DEP|AN
   	* 18,4,12|0,13,6|0,19,1|4,11,0|9,0,17|20,13,19|20,10,12|0,18,0|3,4,15|0,13

	

6. Angka yang dikonversi akan dimasukkan ke dalam fungsi perhitungan Ketika tombol enkripsi/dekripsi ditekan,
   menggunakan matriks kunci default yang sudah ada.

   * (Matriks kunci x Konversi) modulo 26
   * 18,4,12|0,13,6|0,19,1|4,11,0|9,0,17|20,13,19|20,10,12|0,18,0|3,4,15|0,13
   * 8,2,10|6,8,25|15,2,0|2,20,7|19,1,19|9,8,22|8,20,22|16,2,20|25,19,15|13,13
   

8. Hasil enkripsi/dekripsi dikonversi Kembali menjadi dalam bentuk huruf yang akan ditampilkan di form output.
   * ICKGIZPCACUHTBTJIWIUWQCUZTPNN
   * SEMANGATBELAJARUNTUKMASADEPAN

==============================================================================================
   ![image](https://github.com/user-attachments/assets/d09e1867-f79d-47cd-a9d4-3f5cf1bdd9b4)
   * Keterangan : UJICOBA LOGIKA ENKRIPSI MENGGUNAKAN BAHASA C++ DI CODEBLOCK
==============================================================================================  
   ![image](https://github.com/user-attachments/assets/f0c03dda-f480-41e1-923a-4bb3b94cd5bf)
   * Keterangan : UJICOBA LOGIKA ENKRIPSI MENGGUNAKAN BAHASA C++ DI CODEBLOCK
==============================================================================================
   

