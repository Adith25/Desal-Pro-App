# DesalPro
DesalPro adalah sebuah proyek yang bertujuan untuk mengembangkan sebuah alat desalinasi air laut berbasis mikrokontroler ESP32 dan aplikasi mobile untuk memantau kualitas air hasil desalinasi. Alat ini menggunakan metode distilasi dan dilengkapi dengan berbagai sensor untuk mengukur parameter kualitas air seperti pH, salinitas, dan suhu.

## Fitur Utama
1. **Pemantauan Real-time**: Memantau kualitas air (pH, salinitas, suhu) secara langsung dari aplikasi.
2. **Kontrol Pompa**: Menghidupkan atau mematikan pompa air melalui aplikasi.
3. **Status Koneksi**: Menampilkan status koneksi alat dengan aplikasi.
4. **Riwayat Penggunaan**: Menyimpan dan menampilkan riwayat penggunaan pompa air.

### Alat Desalinasi
- **ESP32 sebagai mikrokontroler utama**: Mengontrol semua operasi alat.


##Teknologi Yang Digunakan
- **Flutter** : Framework yang digunakan untuk pengembangan aplikasi mobile.
- **ESP32** : Mikrokontroler untuk Mengontrol semua operasi alat.
- **Pompa Air** : Digunakan untuk mengalirkan air dari sumber air asin ke alat.
- **Pemanas Air** : Sumber panas untuk melakukan proses distilasi.
- **Sensor Load Cell** : Mengukur berat air untuk otomatisasi pemanas.
- **Sensor Suhu** : Mengukur suhu air.
- **Sensor Salinitas** : Mengukur kadar kandungan garam dalam air.
- **Sensor pH** : Mengukur tingkat kandungan keasaman air.

## Instalasi dan Penggunaan

### Persyaratan

- **Hardware**: ESP32, sensor suhu, sensor salinitas, sensor pH, load cell, pompa air, pemanas air.
- **Software**: Flutter, Firebase (Real-time Database dan Firestore).

### Langkah-langkah

1. **Clone Repository**:
   ```sh
   git clone https://github.com/username/repo-name.git
   cd repo-name
