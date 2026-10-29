import 'package:flutter_bloc/flutter_bloc.dart';

class BelanjaCubit extends Cubit<int> {
  // super(0) = nilai awal state adalah 0
  BelanjaCubit() : super(0);

  void tambahKeranjang([int jumlah = 1]) {
    if (jumlah > 0) {
      emit(state + jumlah); // emit = kirim state baru, UI otomatis update
    }
  }


  void kurangiBarang() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}