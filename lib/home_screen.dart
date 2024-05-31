import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desal_pro/riwayat_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
  bool isPumpRunning = false;

  @override
  void initState() {
    super.initState();
    initFirebaseData();
  }

  void initFirebaseData() {
    // Inisialisasi data dari Firebase
    FirebaseDatabase.instance.ref().child('ph_air').onValue.listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      if (event.snapshot.value != null) {
        setState(() {
          ph_air = int.parse(event.snapshot.value.toString());
        });
      }
    });

    FirebaseDatabase.instance.ref().child('salinitas').onValue.listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      if (event.snapshot.value != null) {
        setState(() {
          kandungan_garam = double.parse(event.snapshot.value.toString());
        });
      }
    });

    FirebaseDatabase.instance.ref().child('suhu').onValue.listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      if (event.snapshot.value != null) {
        setState(() {
          suhu_air = int.parse(event.snapshot.value.toString());
        });
      }
    });

    FirebaseDatabase.instance.ref().child('volume1').onValue.listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      if (event.snapshot.value != null) {
        setState(() {
          volume1 = int.parse(event.snapshot.value.toString());
        });
      }
    });

    FirebaseDatabase.instance.ref().child('volume2').onValue.listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      if (event.snapshot.value != null) {
        setState(() {
          volume2 = int.parse(event.snapshot.value.toString());
        });
      }
    });

    FirebaseDatabase.instance.ref().child('volume3').onValue.listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      if (event.snapshot.value != null) {
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
                SizedBox(height: 20),
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
                      width: 41,
                      height: 11,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 16, 229, 23),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: Image.asset(
              'images/Logo.png',
              width: 90,
              height: 80,
            ),
          ),
          Positioned(
            top: 200,
            left: 19,
            right: 19,
            bottom: 19,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
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
                      width: 300,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'pH Air:                                        $ph_air',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Kandungan Garam:                   $kandungan_garam',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Suhu Air:                                    $suhu_air°C',
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
                    padding: const EdgeInsets.only(left: 15),
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
                      width: 300,
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
                    
                            'Volume Air:                               $volume1 ml',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Kapasitas Penampungan:       5000 ml',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 20),
                          Divider(
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
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
                            'Volume Air:                                $volume2 ml',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Kapasitas Penampungan:        2000 ml',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          Divider(
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
                            'Volume Air:                                $volume3 ml',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Kapasitas Penampungan:        7000 ml',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          _buildSwitch(),
                          SizedBox(height: 10),
                          _buildHistoryButton(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildSwitch() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isPumpRunning ? Colors.red : Colors.green, // Button color
          padding: EdgeInsets.symmetric(
              horizontal: 24, vertical: 12), // Button padding
        ),
        onPressed: () async {
          setState(() {
            isPumpRunning = !isPumpRunning; // Toggle pump status
          });

          if (isPumpRunning) {
            _startPump(); // Call function to start the pump
          } else {
            _stopPump(); // Call function to stop the pump
          }
        },
        child: Text(
          isPumpRunning ? 'Matikan Pompa Air' : 'Hidupkan Pompa Air',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }



  void _startPump() async {
    // Logika untuk memulai pompa air
    await FirebaseFirestore.instance.collection('Riwayat Pompa Air').add({
      'status_alat': true,
      'waktu': Timestamp.now(),
    });
  }

  void _stopPump() async {
    // Logika untuk menghentikan pompa air
    await FirebaseFirestore.instance.collection('Riwayat Pompa Air').add({
      'status_alat': false,
      'waktu': Timestamp.now(),
    });
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
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.blue),
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
}
