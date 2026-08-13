<div align="center">

# DesalPro

### Sistem Desalinasi Air Laut Cerdas Berbasis IoT

**Integrasi Mikrokontroler ESP32 & Aplikasi Mobile untuk Pemantauan Kualitas Air Real-time**

</div>

---

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/MCU-ESP32-E7352C?style=for-the-badge&logo=espressif&logoColor=white" alt="ESP32" />
  <img src="https://img.shields.io/badge/Project-Innovillage%202024-00A86B?style=for-the-badge&logoColor=white" alt="Innovillage 2024" />
  <img src="https://img.shields.io/badge/Status-Top%2050%20Social%20Project-FF6B35?style=for-the-badge&logoColor=white" alt="Top 50" />
</p>

---

## Daftar Isi

- [Tentang Proyek](#tentang-proyek)
- [Penghargaan & Pencapaian](#penghargaan--pencapaian)
- [Latar Belakang](#latar-belakang)
- [Fitur Utama](#fitur-utama)
- [Arsitektur Sistem](#arsitektur-sistem)
- [Teknologi yang Digunakan](#teknologi-yang-digunakan)
- [Spesifikasi Perangkat Keras](#spesifikasi-perangkat-keras)
- [Instalasi](#instalasi)
- [Penggunaan](#penggunaan)
- [Tim Pengembang](#tim-pengembang)
- [Lisensi](#lisensi)

---

## Tentang Proyek

**DesalPro** adalah sebuah inovasi sistem desalinasi air laut berbasis IoT yang mengintegrasikan mikrokontroler ESP32 dengan aplikasi mobile Flutter. Proyek ini dirancang untuk menyediakan solusi berkelanjutan dalam mengolah air laut menjadi air layak guna melalui metode distilasi, dengan pemantauan kualitas air secara **real-time** melalui aplikasi smartphone.

Sistem ini dilengkapi dengan berbagai sensor presisi untuk mengukur parameter kualitas air seperti **pH**, **salinitas**, dan **suhu**, serta kontrol pompa otomatis dan manual melalui aplikasi — menjadikannya solusi terintegrasi untuk wilayah pesisir dengan keterbatasan akses air bersih.

---

## Penghargaan & Pencapaian

<div align="center">

### Top 50 Social Project Program
### Innovillage 2024

*Issued by Telkom University · April 2025*

</div>

> **Innovillage** adalah program pengembangan kapasitas yang diperuntukkan bagi mahasiswa untuk menciptakan solusi teknologi yang berdampak sosial. DesalPro terpilih sebagai **Top 50 Social Project** dari ratusan proposal di seluruh Indonesia.

### Pencapaian Kunci

| Metrik | Hasil |
|:---|:---|
| Peringkat | **Top 50 Social Project** Innovillage 2024 |
| Reliabilitas Sistem | **98.2%** |
| Efisiensi Penggunaan Air Bersih | Pengurangan **~30%** |
| Tim | Multidisiplin lintas bidang |
| Lokasi Implementasi | Mushalla Darul Faizin, Banda Aceh |

---

## Latar Belakang

Indonesia sebagai negara kepulauan terbesar di dunia menghadapi paradoks air: dikelilingi oleh air laut yang melimpah, namun banyak wilayah pesisir mengalami krisis akses air bersih. Sementara itu, kebutuhan air bersih terus meningkat seiring pertumbuhan populasi dan aktivitas industri.

**DesalPro** hadir sebagai jawaban atas tantangan tersebut — sebuah sistem desalinasi terjangkau, cerdas, dan dapat dipantau jarak jauh yang:

- **Berdaya guna** — memanfaatkan sumber air laut yang sebelumnya tidak dapat dikonsumsi
- **Cerdas** — terintegrasi IoT untuk pemantauan dan kontrol real-time
- **Berkelanjutan** — metode distilasi ramah lingkungan tanpa bahan kimia tambahan
- **Terdampak sosial** — dirancang untuk komunitas dengan keterbatasan akses air bersih

Proyek ini juga memperluas pengalaman tim dalam mengembangkan sistem IoT berdampak sosial, melanjutkan keberhasilan implementasi **sistem daur ulang air wudu otomatis berbasis IoT** di Mushalla Darul Faizin, Banda Aceh — yang mencapai reliabilitas 98.2% dan mengurangi penggunaan air bersih hingga 30%.

---

## Fitur Utama

### 1. Pemantauan Real-time
Pantau kualitas air hasil desalinasi secara langsung dari aplikasi mobile. Data sensor pH, salinitas, dan suhu ditampilkan dalam grafik interaktif yang terus diperbarui.

| Parameter | Deskripsi | Range Pengukuran |
|:---|:---|:---|
| **pH** | Tingkat keasaman air | 0–14 pH |
| **Salinitas** | Kadar kandungan garam | 0–50 ppt |
| **Suhu** | Suhu air real-time | 0–100°C |

### 2. Kontrol Pompa Remote
Hidupkan atau matikan pompa air kapan saja, dari mana saja — langsung melalui aplikasi mobile. Mendukung mode **manual** dan **otomatis** berdasarkan pembacaan sensor.

### 3. Status Koneksi
Indikator status koneksi real-time antara perangkat keras dan aplikasi, memastikan pengguna selalu terhubung dengan sistem.

### 4. Riwayat Penggunaan
Penyimpanan dan visualisasi riwayat penggunaan pompa air, memungkinkan analisis pola konsumsi dan efisiensi sistem dari waktu ke waktu.

### 5. Otomatisasi Berbasis Sensor Load Cell
Sistem otomatisasi pemanas air berdasarkan pembacaan berat air dari sensor load cell — memastikan efisiensi energi dan keamanan operasional.

---

## Arsitektur Sistem

```
┌─────────────────────────────────────────────────────────────────┐
│                        APLIKASI MOBILE                          │
│                      (Flutter - Cross Platform)                 │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐   │
│  │ Dashboard │  │ Kontrol   │  │ Riwayat   │  │ Status    │   │
│  │ Real-time │  │ Pompa     │  │ Penggunaan│  │ Koneksi   │   │
│  └─────┬─────┘  └─────┬─────┘  └─────┬─────┘  └─────┬─────┘   │
│        │              │              │              │          │
│        └──────────────┴──────┬───────┴──────────────┘          │
│                              │                                 │
│                    ┌─────────▼─────────┐                       │
│                    │  WebSocket / MQTT │                       │
│                    │   Communication   │                       │
│                    └─────────┬─────────┘                       │
└──────────────────────────────┼─────────────────────────────────┘
                               │
                               │ Wi-Fi / Internet
                               │
┌──────────────────────────────┼─────────────────────────────────┐
│                    ┌─────────▼─────────┐                       │
│                    │   ESP32 MCU       │                       │
│                    │   (Controller)    │                       │
│                    └─────────┬─────────┘                       │
│           ┌──────────────────┼──────────────────┐              │
│           │                  │                  │              │
│  ┌────────▼───────┐ ┌───────▼────────┐ ┌───────▼────────┐     │
│  │  Sensor Suite  │ │  Aktuator      │ │  Load Cell     │     │
│  │                │ │                │ │  Sensor        │     │
│  │ • pH Sensor    │ │ • Pompa Air    │ │  (Berat Air)   │     │
│  │ • Salinitas    │ │ • Pemanas Air  │ │                │     │
│  │ • Suhu         │ │                │ │                │     │
│  └────────────────┘ └────────────────┘ └────────────────┘     │
│                                                                 │
│                     PERANGKAT KERAS                             │
└─────────────────────────────────────────────────────────────────┘
```

---

## Teknologi yang Digunakan

### Software

| Kategori | Teknologi | Deskripsi |
|:---|:---|:---|
| Mobile App | **Flutter** | Framework cross-platform untuk pengembangan aplikasi mobile (Android & iOS) |
| Firmware | **Arduino IDE / PlatformIO** | Lingkungan pengembangan untuk pemrograman ESP32 |
| Komunikasi | **WebSocket / MQTT** | Protokol komunikasi real-time antara ESP32 dan aplikasi |
| Database | **Firebase / Local Storage** | Penyimpanan riwayat penggunaan dan data sensor |

### Hardware

| Komponen | Fungsi |
|:---|:---|
| **ESP32** | Mikrokontroler utama yang mengontrol seluruh operasi alat |
| **Pompa Air** | Mengalirkan air dari sumber air asin ke alat desalinasi |
| **Pemanas Air** | Sumber panas untuk proses distilasi |
| **Sensor Load Cell** | Mengukur berat air untuk otomatisasi pemanas |
| **Sensor Suhu** | Mengukur suhu air secara real-time |
| **Sensor Salinitas** | Mengukur kadar garam dalam air |
| **Sensor pH** | Mengukur tingkat keasaman air |

---

## Spesifikasi Perangkat Keras

### Bill of Materials (BOM)

| No | Komponen | Jumlah | Keterangan |
|:---|:---|:---|:---|
| 1 | ESP32 DevKit | 1 | Mikrokontroler utama |
| 2 | Sensor pH (Analog) | 1 | Pengukur keasaman air |
| 3 | Sensor Salinitas | 1 | Pengukur kadar garam |
| 4 | Sensor Suhu (DS18B20) | 1 | Pengukur suhu air |
| 5 | Load Cell + HX711 | 1 | Sensor berat air |
| 6 | Modul Relay | 2 | Kontrol pompa & pemanas |
| 7 | Pompa Air DC | 1 | Sirkulasi air |
| 8 | Pemanas Air (Heater) | 1 | Proses distilasi |
| 9 | Power Supply 12V | 1 | Catu daya sistem |
| 10 | Breadboard / PCB | 1 | Media pengkabelan |

---

## Instalasi

### Prasyarat

Pastikan perangkat Anda telah terinstal:

- [Flutter](https://flutter.dev/docs/get-started/install) (v3.0+)
- [Dart](https://dart.dev/get-dart) (v2.17+)
- [Arduino IDE](https://www.arduino.cc/en/software) atau [PlatformIO](https://platformio.org/)
- [Git](https://git-scm.com/downloads)
- ESP32 Board Package untuk Arduino IDE

### 1. Clone Repository

```sh
git clone https://github.com/Adith25/Desal-Pro-App.git
cd Desal-Pro-App
```

### 2. Setup Aplikasi Mobile (Flutter)

```sh
# Install dependencies
flutter pub get

# Jalankan aplikasi dalam mode debug
flutter run
```

### 3. Setup Firmware ESP32

1. Buka file firmware `.ino` di **Arduino IDE** atau **PlatformIO**
2. Pilih board: **ESP32 Dev Module**
3. Konfigurasi kredensial Wi-Fi:
   ```cpp
   const char* ssid = "YOUR_WIFI_SSID";
   const char* password = "YOUR_WIFI_PASSWORD";
   ```
4. Upload firmware ke ESP32
5. Verifikasi koneksi melalui Serial Monitor (baud rate: `115200`)

### 4. Konfigurasi Koneksi

Pastikan ESP32 dan perangkat mobile terhubung ke jaringan yang sama, atau konfigurasikan alamat IP ESP32 pada aplikasi mobile di menu pengaturan.

---

## Penggunaan

### Alur Operasional

```
1. Buka aplikasi DesalPro di smartphone
       │
       ▼
2. Pastikan status koneksi menunjukkan "Terhubung"
       │
       ▼
3. Pantau parameter kualitas air pada dashboard
       │
       ▼
4. Kontrol pompa (manual) atau aktifkan mode otomatis
       │
       ▼
5. Tinjau riwayat penggunaan untuk analisis efisiensi
```

### Mode Operasi

| Mode | Deskripsi |
|:---|:---|
| **Manual** | Pengguna mengontrol pompa dan pemanas secara langsung melalui aplikasi |
| **Otomatis** | Sistem mengatur pompa dan pemanas berdasarkan pembacaan sensor (load cell, suhu) |

---

## Tim Pengembang

Proyek ini dikembangkan oleh tim multidisiplin yang dipimpin untuk menghadirkan solusi teknologi berdampak sosial.

<div align="center">

| Peran | Kontribusi |
|:---|:---|
| **Project Lead** | Adith Ramadhan — Kepemimpinan tim, desain sistem, & implementasi IoT |
| **Hardware Engineer** | Desain rangkaian sensor & integrasi ESP32 |
| **Mobile Developer** | Pengembangan aplikasi Flutter |
| **Firmware Developer** | Pemrograman ESP32 & protokol komunikasi |

</div>

---

## Lisensi

Proyek ini dilisensikan di bawah **MIT License** — lihat file [LICENSE](LICENSE) untuk detail lengkap.

---

<div align="center">

### DesalPro — Air Bersih untuk Indonesia

**Top 50 Social Project · Innovillage 2024 · Telkom University**

*Berkontribusi pada akses air bersih berkelanjutan untuk komunitas pesisir Indonesia*

---

Jika proyek ini bermanfaat, berikan **star** di repository ini!

</div>
