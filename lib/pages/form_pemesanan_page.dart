import 'package:flutter/material.dart';

// [LATIHAN 3] StatefulWidget, karena radio dan checkbox perlu menyimpan pilihan
class FormPemesananPage extends StatefulWidget {
  const FormPemesananPage({super.key});

  @override
  State<FormPemesananPage> createState() => _FormPemesananPageState();
}

class _FormPemesananPageState extends State<FormPemesananPage> {
  // Controller untuk mengambil isi TextField
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final teleponController = TextEditingController();

  // Menyimpan pilihan metode pembayaran (default: Tunai)
  String metodePengiriman = 'Diantar';

  // Menyimpan status checkbox (default: belum dicentang)
  bool setuju = false;

  // Controller dibuang saat halaman ditutup supaya tidak boros memori
  @override
  void dispose() {
    namaController.dispose();
    teleponController.dispose();
    super.dispose();
  }

  // Dijalankan saat tombol "Kirim Pesanan" ditekan
  void kirimPesanan() {
    // Jika checkbox belum dicentang, tampilkan peringatan lalu berhenti
    if (!setuju) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Centang persetujuan terlebih dahulu')),
      );
      return;
    }

    // Jika sudah dicentang, tampilkan SnackBar sukses
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pesanan berhasil dibuat')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pemesanan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // TextField 1: nama pembeli
          TextField(
            controller: namaController,
            decoration: const InputDecoration(
              labelText: 'Nama Pembeli',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: alamatController,
            decoration: const InputDecoration(
              labelText: 'Alamat Pengiriman',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          const Text('Metode Pengiriman'),

          // RadioListTile pilihan 1: Tunai
          // groupValue = pilihan yang sedang aktif,
          // value = nilai milik radio ini
          RadioListTile<String>(
            title: const Text('Diantar'),
            value: 'Diantar',
            groupValue: metodePengiriman,
            onChanged: (value) {
              setState(() => metodePengiriman = value!);
            },
          ),
          // RadioListTile pilihan 2: Transfer
          RadioListTile<String>(
            title: const Text('Ambil di Tempat'),
            value: 'Ambil di Tempat',
            groupValue: metodePengiriman,
            onChanged: (value) {
            setState(() => metodePengiriman = value!);
            },
          ),

          // Checkbox persetujuan
          Row(
            children: [
              Checkbox(
                value: setuju,
                onChanged: (value) {
                  setState(() => setuju = value ?? false);
                },
              ),
              const Expanded(child: Text('Saya menyetujui pesanan ini')),
            ],
          ),

          // Tombol Kirim Pesanan
          FilledButton(
            onPressed: kirimPesanan,
            child: const Text('Kirim Pesanan'),
          ),
        ],
      ),
    );
  }
}