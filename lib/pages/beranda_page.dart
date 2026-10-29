import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../state/belanja_cubit.dart';
import '../state/favorit_provider.dart';
import 'form_pemesanan_page.dart';
import 'produk_page.dart';
import 'lokasi_page.dart';

// Halaman Beranda tidak punya state sendiri, jadi cukup StatelessWidget
class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EcoMart - Aplikasi E-Commerce Produk Daur Ulang Menggunakan Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              'Selamat Datang di Ecomart',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // [LATIHAN 1] Deskripsi singkat aplikasi
            const Text(
              'Ecomart adalah Aplikasi E-Commerce Produk daur ulang. '
              'Ecomart menyediakan fitur katalog produk, keranjang belanja, '
              'formulir pemesanan, dan peta lokasi.',
            ),
            const SizedBox(height: 24),

            // memakai Navigator.push()
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const KatalogPage()),
                );
              },
              child: const Text('Lihat Produk'),
            ),

            // [LATIHAN 3] Tombol menuju halaman Form Pemesanan
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FormPemesananPage(),
                  ),
                );
              },
              child: const Text('Form Pemesanan'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LokasiPage()),
                );
              },
              child: const Text('Lokasi Ecomart'),
            ),
            const SizedBox(height: 24),

            Consumer<FavoritProvider>(
              builder: (context, favorit, child) {
                return Text('Jumlah favorit: ${favorit.jumlahFavorit}');
              },
            ),
            const SizedBox(height: 8),
            BlocBuilder<BelanjaCubit, int>(
              builder: (context, jumlah) {
                return Text('Barang dalam keranjang: $jumlah');
              },
            ),
          ],
        ),
      ),
    );
  }
}