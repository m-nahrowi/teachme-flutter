import 'package:flutter/material.dart';
import 'package:aplikasi_teachme/pages/pengajar_detail.dart';
import 'package:aplikasi_teachme/pages/pengajar_detail_nahrowi.dart';
import 'package:aplikasi_teachme/pages/pengajar_detail_hanifa.dart';
import 'package:aplikasi_teachme/pages/pengajar_detail_feri.dart';

void main() => runApp(Pengajar());

class Pengajar extends StatefulWidget {
  const Pengajar({Key? key}) : super(key: key);

  @override
  _PengajarState createState() => _PengajarState();
}

class _PengajarState extends State<Pengajar> {
  List<int> notifikasiCounts = List.filled(pengajarList.length, 0);
  List<bool> isDihubungi = List.filled(pengajarList.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajar'),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Tambahkan logika untuk menangani tindakan notifikasi
                  setState(() {
                    notifikasiCounts = List.filled(pengajarList.length, 0);
                  });
                },
              ),
              if (notifikasiCounts.any((count) => count > 0))
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    notifikasiCounts.reduce((a, b) => a + b).toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: pengajarList.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  pengajarList[i].imagePath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      'images/location.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Text(
                            "${pengajarList[i].name}\njarak ${pengajarList[i].distance}",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => pengajarList[i].detailPage,
                      ),
                    );
                  },
                  child: const Text(
                    'Detail',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: isDihubungi[i] ? Colors.grey : Colors.blue,
                  ),
                  onPressed: () {
                    // Tambahkan logika untuk menangani tindakan "Hubungi"
                    setState(() {
                      if (!isDihubungi[i]) {
                        notifikasiCounts[i]++;
                      } else if (notifikasiCounts[i] > 0) {
                        notifikasiCounts[i]--;
                      }
                      isDihubungi[i] = !isDihubungi[i];
                    });
                  },
                  child: Text(
                    isDihubungi[i]
                        ? 'Dihubungi'
                        : 'Hubungi${notifikasiCounts[i] > 0 ? ' (${notifikasiCounts[i]})' : ''}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PengajarModel {
  final String imagePath;
  final String name;
  final String distance;
  final Widget detailPage;

  PengajarModel({
    required this.imagePath,
    required this.name,
    required this.distance,
    required this.detailPage,
  });
}

final List<PengajarModel> pengajarList = [
  PengajarModel(
    imagePath: 'images/nahrowi-2.jpg',
    name: 'Muhamad Nahrowi',
    distance: '50 m',
    detailPage: PengajarDetailNahrowi(),
  ),
  PengajarModel(
    imagePath: 'images/hanifah.jpg',
    name: 'Hanifah Ananda Putri',
    distance: '100 m',
    detailPage: PengajarDetailHanifa(),
  ),
  PengajarModel(
    imagePath: 'images/feriarosa.jpg',
    name: 'Feri Arosa',
    distance: '150 m',
    detailPage: PengajarDetailFeri(),
  ),
];
