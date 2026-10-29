import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LokasiPage extends StatelessWidget {
  const LokasiPage({super.key});

  // Koordinat lokasi GreenLife (latitude, longitude) sesuai soal
  static const LatLng lokasiGreenLife = LatLng(
    -6.914744,
    107.609810,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi Komunitas'),
      ),
      // Widget GoogleMap menampilkan peta
      body: GoogleMap(
        // Posisi awal kamera: di koordinat GreenLife dengan zoom 15
        initialCameraPosition: const CameraPosition(
          target: lokasiGreenLife,
          zoom: 15,
        ),
        // Satu marker bernama "GreenLife Bandung" di koordinat yang sama
        markers: {
          const Marker(
            markerId: MarkerId('Bank_Sampah_Hijau'), // ID unik marker
            position: lokasiGreenLife,
            infoWindow: InfoWindow(
              title: 'Bank Sampah Hijau', // teks saat marker ditekan
            ),
          ),
        },
      ),
    );
  }
}