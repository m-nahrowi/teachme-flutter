import 'package:flutter/material.dart';
import 'package:aplikasi_teachme/main.dart';
import 'package:flutter/services.dart';

class PengajarDetailHanifa extends StatelessWidget {
  const PengajarDetailHanifa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajar detail'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'images/hanifah.jpg',
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
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.all(5),
                          child: const Text(
                            "Hanifah \njarak 100 m",
                            style: TextStyle(
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
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "Profile Pengajar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: const Text(
                      "Menuju Lokasi",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // Aksi ketika button diklik
                      // harusnya menuju ke halaman maps, feture belum dibuat
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
