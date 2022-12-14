part of 'resep_makanan_cubit.dart';

@immutable
abstract class ResepMakananState {}

class ResepMakananInitial extends ResepMakananState {}

// Tambahkan State untuk Data Resep Makanan
class DataResepMakanan extends ResepMakananState {
  final ResepMakananModel data;
  DataResepMakanan(this.data);
}

// Tambahkan State untuk Data Detail Resep Makanan
class DataDetailResepMakanan extends ResepMakananState {
  final DetailResepMakananModel data;
  DataDetailResepMakanan(this.data);
}
