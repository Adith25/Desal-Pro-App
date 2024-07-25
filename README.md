# DesalPro

## Deskripsi Proyek

DesalPro adalah sebuah proyek yang bertujuan untuk mengembangkan sebuah alat desalinasi air laut berbasis mikrokontroler ESP32 dan aplikasi mobile untuk memantau kualitas air hasil desalinasi. Alat ini menggunakan metode distilasi dan dilengkapi dengan berbagai sensor untuk mengukur parameter kualitas air seperti pH, salinitas, dan suhu.

## Fitur

### Alat Desalinasi

- **ESP32 sebagai mikrokontroler utama**: Mengontrol semua operasi alat.
- **Pompa Air**: Mengalirkan air dari sumber air asin ke alat.
- **Pemanas Air**: Sumber panas untuk proses distilasi.
- **Sensor Load Cell**: Mengukur berat air untuk otomatisasi pemanas.
- **Sensor Suhu**: Mengukur suhu air.
- **Sensor Salinitas**: Mengukur kadar garam dalam air.
- **Sensor pH**: Mengukur tingkat keasaman air.

### Aplikasi Mobile

- **Pemantauan Real-time**: Memantau kualitas air (pH, salinitas, suhu) secara langsung dari aplikasi.
- **Kontrol Pompa**: Menghidupkan atau mematikan pompa air melalui aplikasi.
- **Status Koneksi**: Menampilkan status koneksi alat dengan aplikasi.
- **Riwayat Penggunaan**: Menyimpan dan menampilkan riwayat penggunaan pompa air.

## Tahap Pengembangan

1. **Evaluasi Rancangan**: Evaluasi terhadap rancangan mekanis, elektronis, dan desain UI/UX aplikasi.
2. **Pengembangan Prototype Hardware**: Pembuatan prototype alat desalinasi menggunakan ESP32 dan sensor-sensor terkait.
3. **Pengembangan Prototype Software**: Pembuatan aplikasi mobile untuk memantau dan mengontrol alat desalinasi.
4. **Pengujian Alat dan Evaluasi**: Pengujian dan evaluasi alat serta aplikasi untuk memastikan fungsionalitas sesuai rancangan.

## Instalasi dan Penggunaan

### Persyaratan

- **Hardware**: ESP32, sensor suhu, sensor salinitas, sensor pH, load cell, pompa air, pemanas air.
- **Software**: Flutter, Firebase (Real-time Database dan Firestore).

### Langkah-langkah

1. **Clone Repository**:
   ```sh
   git clone https://github.com/username/repo-name.git
   cd repo-name
