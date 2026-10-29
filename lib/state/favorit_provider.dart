import 'package:flutter/foundation.dart';

class FavoritProvider extends ChangeNotifier {
  // Variabel jumlahFavorit dengan nilai awal 0
  int jumlahFavorit = 0;

  // Method untuk menambah favorit
  void tambahFavorit() {
    jumlahFavorit++;
    notifyListeners();
  }
}