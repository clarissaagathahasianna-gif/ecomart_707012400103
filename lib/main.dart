import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'pages/beranda_page.dart';
import 'state/belanja_cubit.dart';
import 'state/favorit_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritProvider(),
      // [LATIHAN 5] BlocProvider menyediakan BelanjaCubit
      // ke seluruh widget di bawahnya.
      child: BlocProvider(
        create: (_) => BelanjaCubit(),
        child: const GreenShopApp(),
      ),
    ),
  );
}

class GreenShopApp extends StatelessWidget {
  const GreenShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // sembunyikan label "debug"
      title: 'ecomart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      // Halaman pertama yang tampil saat aplikasi dibuka
      home: const BerandaPage(),
    );
  }
}