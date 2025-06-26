    #include <conio.h>
    #include <iostream>
    #include <vector>
    #include <string>
    #include <cctype>

    using namespace std;

    void printLine(string line){ // untuk membuat garis di judul pada posisi atas di tampilan aplikasi
        for(int i=0; i<120; i++){
            cout << line;
        }
    }

    void abjad(){
        string huruf[26] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
        for (int i=0; i < 26; i++){
            cout << "\t"  << huruf[i] << " = " << i << "\t" ;
                if(i % 4 == 3){
                   cout << endl;
                }
            }
        }

    void cetakKunci2x2(){
        int kunci2x2[] = {3,3,2,5};
        cout << "\n\n Matriks Kunci enkripsi 2x2\n";
        cout << "| " << kunci2x2[0] << " " << kunci2x2[1] << " |" << endl;
        cout << "| " << kunci2x2[2] << " " << kunci2x2[3] << " |" << endl;
    }

    string cleanText(string input){
        string hasil = "";
        for(char c : input){
            if(isalpha(c)){
                hasil += toupper(c);
            }
        }
        return hasil;
    }

    vector<int> convertToNumber(string text){
        vector<int> konversi;
        for (char c : text){
            if(isalpha(c)){
                c = toupper(c);
                konversi.push_back(c - 'A');
            }
        }
       return konversi;
    }
    char angkaKeHuruf(int angka) {
        return static_cast<char>(angka + 'A'); // karena 'A' = 65
    }


    void cetakKunci3x3(){
        int kunci3x3[] = {6,24,1,13,16,10,20,17,15};
        cout << "\n\n Matriks Kunci enkripsi 3x3\n";
        cout << "| " << kunci3x3[0] << " "  << kunci3x3[1] << " " << kunci3x3[2] << " |" << endl;
        cout << "| " << kunci3x3[3] << " " << kunci3x3[4] << " " << kunci3x3[5] << " |" << endl;
        cout << "| " << kunci3x3[6] << " " << kunci3x3[7] << " " << kunci3x3[8] << " |" << endl;
    }

        void enkripsi2x2(int abjad1, int abjad2){
        int kunci2x2[] = {3,3,2,5};
        int enkripsi1 = kunci2x2[0] * abjad1 + kunci2x2[1] * abjad2;
        int enkripsi2 = kunci2x2[2] * abjad1 + kunci2x2[3] * abjad2;
        int modulo1 = enkripsi1 % 26;
        int modulo2 = enkripsi2 % 26;

        cout << abjad1 << "," << abjad2 << " ===> "
             << modulo1 << "," << modulo2
             << "  ==>  " << angkaKeHuruf(modulo1) << angkaKeHuruf(modulo2);
    }



    void enkripsi3x3(int abjad1, int abjad2, int abjad3){
        int kunci3x3[] = {6,24,1,13,16,10,20,17,15};
        int enkripsi1 = kunci3x3[0] * abjad1 + kunci3x3[1] * abjad2 + kunci3x3[2] * abjad3;
        int enkripsi2 = kunci3x3[3] * abjad1 + kunci3x3[4] * abjad2 + kunci3x3[5] * abjad3;
        int enkripsi3 = kunci3x3[6] * abjad1 + kunci3x3[7] * abjad2 + kunci3x3[8] * abjad3;
        int modulo1, modulo2, modulo3;
        modulo1 = enkripsi1 % 26;
        modulo2 = enkripsi2 % 26;
        modulo3 = enkripsi3 % 26;
          cout << abjad1 << "," << abjad2 << "," << abjad3<< " ===> "
             << modulo1 << "," << modulo2 << "," << modulo3
             << "  ==>  " << angkaKeHuruf(modulo1) << angkaKeHuruf(modulo2) << angkaKeHuruf(modulo3);
    }

    void dekripsi2x2(int abjad1, int abjad2){
         int kunci2x2[] = {15,17,20,9};
         int dekripsi1 = kunci2x2[0] * abjad1 + kunci2x2[1] * abjad2;
         int dekripsi2 = kunci2x2[2] * abjad1 + kunci2x2[3] * abjad2;
         int modulo1, modulo2;
         modulo1 = dekripsi1 % 26;
         modulo2 = dekripsi2 % 26;
         cout << abjad1 << "," << abjad2 << " ===> "
             << modulo1 << "," << modulo2
             << "  ==>  " << angkaKeHuruf(modulo1) << angkaKeHuruf(modulo2);
    }

    void dekripsi3x3(int abjad1, int abjad2, int abjad3){
        int kunci3x3[] = {8,5,10,21,8,21,21,12,8};
        int dekripsi1 = kunci3x3[0] * abjad1 + kunci3x3[1] * abjad2 + kunci3x3[2] * abjad3;
        int dekripsi2 = kunci3x3[3] * abjad1 + kunci3x3[4] * abjad2 + kunci3x3[5] * abjad3;
        int dekripsi3 = kunci3x3[6] * abjad1 + kunci3x3[7] * abjad2 + kunci3x3[8] * abjad3;
        int modulo1, modulo2, modulo3;
        modulo1 = dekripsi1 % 26;
        modulo2 = dekripsi2 % 26;
        modulo3 = dekripsi3 % 26;
           cout << abjad1 << "," << abjad2 << "," << abjad3<< " ===> "
             << modulo1 << "," << modulo2 << "," << modulo3
             << "  ==>  " << angkaKeHuruf(modulo1) << angkaKeHuruf(modulo2) << angkaKeHuruf(modulo3);
    }
    // Ambil kata per kata
    vector<string> pisahKata(string kalimat) {
        vector<string> hasil;
        string kata = "";
        for (char c : kalimat) {
            if (isalpha(c)) {
                kata += toupper(c);
            } else if (c == ' ' && !kata.empty()) {
                hasil.push_back(kata);
                kata = "";
            }
        }
        if (!kata.empty()) hasil.push_back(kata);
        return hasil;
    }

    // Fungsi proses
    void logic(vector<int> &angka, bool enkripsi = true) {
        int i = 0;
        while (i < angka.size()) {
            int sisa = angka.size() - i;

            if (sisa >= 6) {
                // Ambil sebanyak mungkin 3 huruf
                int a = angka[i];
                int b = angka[i + 1];
                int c = angka[i + 2];
                if (enkripsi)
                    enkripsi3x3(a, b, c);
                else
                    dekripsi3x3(a, b, c);
                cout << endl;
                i += 3;
            } else if (sisa == 5) {
                // Ambil 3 huruf dulu, sisa 2 huruf
                int a = angka[i];
                int b = angka[i + 1];
                int c = angka[i + 2];
                if (enkripsi)
                    enkripsi3x3(a, b, c);
                else
                    dekripsi3x3(a, b, c);
                cout << endl;

                int d = angka[i + 3];
                int e = angka[i + 4];
                if (enkripsi)
                    enkripsi2x2(d, e);
                else
                    dekripsi2x2(d, e);
                cout << endl;
                i += 5;
            } else if (sisa == 4) {
                int a = angka[i];
                int b = angka[i + 1];
                int c = angka[i + 2];
                int d = angka[i + 3];
                if (enkripsi)
                    enkripsi2x2(a, b);
                else
                    dekripsi2x2(a, b);
                cout << endl;

                if (enkripsi)
                    enkripsi2x2(c, d);
                else
                    dekripsi2x2(c, d);
                cout << endl;
                i += 4;
            } else if (sisa == 3) {
                int a = angka[i];
                int b = angka[i + 1];
                int c = angka[i + 2];
                if (enkripsi)
                    enkripsi3x3(a, b, c);
                else
                    dekripsi3x3(a, b, c);
                cout << endl;
                i += 3;
            } else if (sisa == 2) {
                int a = angka[i];
                int b = angka[i + 1];
                if (enkripsi)
                    enkripsi2x2(a, b);
                else
                    dekripsi2x2(a, b);
                cout << endl;
                i += 2;
            } else {
                // Sisa 1 huruf → tidak diproses
                cout << "Satu huruf tersisa, tidak diproses: " << angka[i] << endl;
                break;
            }
        }
    }





    int main(){
        printLine("=");
        cout << endl;
        cout << "\t\t\t\t\tEnkripsi & Dekripsi Hill Cipher\n";
        cout << endl;
        printLine("=");
        cout << endl;
        cout << "\t\tBerikut adalah angka-angka berdasar abjad untuk melakukan enkripsi : ";
        cout << endl;
        cout << endl;
        abjad();
        cout << endl;
        cetakKunci2x2();
        cetakKunci3x3();
        printLine("_");

        int mode;
cout << "\nPilih mode:\n1) Enkripsi\n2) Dekripsi\nPilihan: ";
cin >> mode;
cin.ignore(); // agar getline bekerja setelah cin

string teks;
cout << "Masukkan kalimat atau hasil enkripsi: ";
getline(cin, teks);

vector<int> text = convertToNumber(cleanText(teks));
logic(text, mode == 1);

        getch();
    }
