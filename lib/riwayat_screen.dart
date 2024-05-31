import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HistoryPage(),
  ));
}

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting(); // Initialize date formatting
  }

  Future<void> _deleteAllHistory() async {
    final collection =
        FirebaseFirestore.instance.collection('Riwayat Pompa Air');
    final snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  void _confirmDeleteAllHistory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Konfirmasi Hapus'),
        content:
            Text('Apakah Anda yakin ingin menghapus semua riwayat pompa air?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Tidak'),
          ),
          TextButton(
            onPressed: () {
              _deleteAllHistory();
              Navigator.of(context).pop();
            },
            child: Text('Ya'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Riwayat Pompa Air',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xFF0C2366),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _confirmDeleteAllHistory,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Riwayat Pompa Air')
            .orderBy('waktu',
                descending: true) // Mengubah dari descending ke ascending
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/no_data-.png',
                    width: 250,
                    height: 250,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Belum ada data riwayat pompa air',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            );
          }

          List<Map<String, dynamic>> events = _processData(snapshot.data!.docs);

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              var event = events[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 14,
                              color: Colors.grey[600],
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Tanggal',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[600]),
                            ),
                            SizedBox(width: 80),
                            Icon(Icons.access_time,
                                size: 15, color: Colors.grey[600]),
                            SizedBox(width: 2),
                            Text(
                              'Waktu',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(height: 2), // Adjusted from 5 to 2
                        Row(
                          children: [
                            Text(
                              event['date'],
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 25),
                            Text(
                              event['time'],
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 25),
                              decoration: BoxDecoration(
                                color: event['statusAlat']
                                    ? Color.fromARGB(255, 118, 223, 100) // Warna hijau jika statusAlat bernilai true
                                    : Color(
                                        0xFFFC6C61), // Warna merah jika statusAlat bernilai false
                                borderRadius: BorderRadius.circular(
                                    16), // Mengubah ukuran sudut bulat menjadi 16
                              ),
                              child: Text(
                                event['statusAlat'] ? ' ON ' : 'OFF',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> _processData(List<DocumentSnapshot> docs) {
    List<Map<String, dynamic>> events = [];

    for (var doc in docs) {
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        var waktu = (data['waktu'] as Timestamp).toDate();
        var statusAlat = data['status_alat'] as bool;

        events.add({
          'date': _formatDate(waktu),
          'time': _formatTime(waktu),
          'statusAlat': statusAlat,
        });
      }
    }

    return events;
  }

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    return formatter.format(date);
  }

  String _formatTime(DateTime time) {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(time);
  }
}
