// ignore: depend_on_referenced_packages
// import 'package:app/cek_kualitas_air_screen.dart';

import 'package:desal_pro/riwayat_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ph_air = 0;
  double kandungan_garam = 0.0;
  int suhu_air = 0;
  int volume1 = 0;
  int volume2 = 0;
  int volume3 = 0;

  @override
  void initState() {
    super.initState();
    initFirebaseData();
  }

  void initFirebaseData() {
    // Lakukan inisialisasi data dari Firebase
    FirebaseDatabase.instance
        .ref()
        .child('ph_air') // Menggunakan 'debit_air' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          ph_air = int.parse(event.snapshot.value.toString());
        });
      }
    });

    FirebaseDatabase.instance
        .ref()
        .child('salinitas') // Menggunakan 'debit_air' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          kandungan_garam = double.parse(event.snapshot.value.toString());
        });
      }
    });
    FirebaseDatabase.instance
        .ref()
        .child('suhu') // Menggunakan 'debit_air' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          suhu_air = int.parse(event.snapshot.value.toString());
        });
      }
    });
    FirebaseDatabase.instance
        .ref()
        .child('volume1') // Menggunakan 'debit_air' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          volume1 = int.parse(event.snapshot.value.toString());
        });
      }
    });
    FirebaseDatabase.instance
        .ref()
        .child('volume2') // Menggunakan 'debit_air' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          volume2 = int.parse(event.snapshot.value.toString());
        });
      }
    });
    FirebaseDatabase.instance
        .ref()
        .child('volume3') // Menggunakan 'debit_air' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          volume3 = int.parse(event.snapshot.value.toString());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF00102C), Color(0xFF3558B4)],
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assalamu\'alaikum,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Selamat datang di Aplikasi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Desal Pro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      'Status Alat Telah Terhubung',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 125),
                    Container(
                      width: 51,
                      height: 13,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            right: 18,
            child: Image.asset(
              'images/Logo.png',
              width: 90,
              height: 90,
            ),
          ),
          Positioned(
            top: 220,
            left: 20,
            right: 20,
            bottom: 5, // Menaruh container ke bawah
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Kualitas Air Penampungan Akhir',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Color(0xFF0C2366),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 300, // Lebar card
                      height: 100,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'pH Air                                               : $ph_air',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Kandungan Garam                         : $kandungan_garam',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Suhu Air                                           : $suhu_air°C',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Volume Penampungan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Color(0xFF0C2366),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 300, // Lebar card
                      height: 468,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Penampungan 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Volume Air                                       : $volume1 ml',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Kapasitas Penampungan               : 5000 ml',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 20),
                          Divider(
                            // Garis pemisah 1
                            color: Colors.white,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Penampungan 2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Volume Air                                       : $volume2 ml',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text('Kapasitas Penampungan               : 2000 ml',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              )),
                          SizedBox(height: 20),
                          Divider(
                            // Garis pemisah 2
                            color: Colors.white,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Penampungan Akhir',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Volume Air                                       : $volume3 ml',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Kapasitas Penampungan               : 7000 ml',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 20),
                          _buildCheckButton(context), // Tombol cek
                          SizedBox(height: 10),
                          _buildHistoryButton(
                              context), // Tombol riwayat pompa air
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 55),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 55),
                // Tambahkan konten tambahan di sini
              ],
            ),
          ),
        ],
      ),
    );
  }
}

bool isPumpRunning = false;

Widget _buildCheckButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: ElevatedButton.icon(
      onPressed: () {
        if (!isPumpRunning) {
          _showConfirmationDialog(context);
        } else {
          _stopPump();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        padding: EdgeInsets.symmetric(
            vertical: 5, horizontal: 80), // Lebar tombol diperbesar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ), // Warna teks dan icon button
      ),
      icon: Icon(
        Icons.power_settings_new,
        color: const Color.fromARGB(255, 243, 0, 0),
        size: 25,
      ),
      label: Text(
        isPumpRunning ? 'Stop Pompa Air' : 'Start Pompa Air',
        style: TextStyle(
          fontSize: 9,
          color: const Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Konfirmasi'),
        content: Text('Apakah Anda ingin menyalakan pompa air?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _startPump();
              // Setelah memulai pompa air, ubah status tombol
              isPumpRunning = true;
            },
            child: Text('Ya'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Tidak'),
          ),
        ],
      );
    },
  );
}

void _startPump() {
  // Lakukan logika untuk memulai pompa air
  // Misalnya, kirim perintah ke perangkat keras
}

void _stopPump() {
  // Lakukan logika untuk menghentikan pompa air
  // Misalnya, kirim perintah ke perangkat keras
  // Setelah menghentikan pompa air, ubah status tombol
  isPumpRunning = false;
}

Widget _buildHistoryButton(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: ElevatedButton(
      onPressed: () {
        // Navigasi ke halaman riwayat
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HistoryPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.transparent, // Warna teks
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ), // Ukuran tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Mengubah bentuk tombol
          side: BorderSide(color: Colors.blue), // Menambahkan border
        ),
      ),
      child: Text(
        'Riwayat Pompa Air',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
