import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HistoryPage(),
  ));
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Pompa Air',
          style: TextStyle(color: Colors.white), // Atur warna teks putih
        ),
        backgroundColor: Color(0xFF0C2366), // Atur warna AppBar
        iconTheme: IconThemeData(
            color: Colors.white), // Atur warna ikon kembali menjadi putih
      ),
      body: ListView.builder(
        itemCount: 15, // Jumlah entri riwayat
        itemBuilder: (context, index) {
          // Menggunakan ListTile untuk setiap entri
          return ListTile(
            leading:
                Icon(Icons.check_circle, color: Colors.green), // Logo checklist
            title: Text(
              _generateDate(
                  index), // Menggunakan fungsi _generateDate untuk menampilkan Hari, Tanggal/Bulan/Tahun
              style: TextStyle(fontWeight: FontWeight.w600), // Font bold
            ),
            subtitle: Text(
              _generateDateTime(index),
              style: TextStyle(fontWeight: FontWeight.w400), // Font bold
            ),
          );
        },
      ),
    );
  }

  // Fungsi untuk menghasilkan tanggal secara acak
  String _generateDate(int index) {
    final now = DateTime.now();
    final entryDate = now.subtract(Duration(days: index));
    final entryDay = entryDate.day;
    final entryMonth = entryDate.month;
    final entryYear = entryDate.year;

    return '${_getDayOfWeek(entryDate.weekday)}, $entryDay/${entryMonth}/${entryYear}';
  }

  // Fungsi untuk menghasilkan tanggal dan waktu secara acak
  String _generateDateTime(int index) {
    final now = DateTime.now();
    final random = Random();
    final onHour = random.nextInt(24); // Acak jam untuk status "On"
    final offHour =
        onHour + random.nextInt(2) + 1; // Acak jam untuk status "Off"

    now.subtract(Duration(
        days:
            index)); // Mendapatkan tanggal entri dengan mengurangi hari sesuai indeks
    // final entryMonth = entryDate.month;
    // final entryYear = entryDate.year;

    return 'On: pada pukul ${onHour.toString().padLeft(2, '0')}:00 - \Off: pada pukul ${offHour.toString().padLeft(2, '0')}:00';
  }

  // Fungsi untuk mendapatkan nama hari dari nomor hari dalam seminggu
  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Senin';
      case 2:
        return 'Selasa';
      case 3:
        return 'Rabu';
      case 4:
        return 'Kamis';
      case 5:
        return 'Jumat';
      case 6:
        return 'Sabtu';
      case 7:
        return 'Minggu';
      default:
        return '';
    }
  }
}
