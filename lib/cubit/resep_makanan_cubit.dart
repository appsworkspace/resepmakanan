import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resepmakanan/model/detail_resep_makanan_model.dart';
import 'package:resepmakanan/request/resep_makanan_request.dart';

import '../model/resep_makanan_model.dart';

part 'resep_makanan_state.dart';

class ResepMakananCubit extends Cubit<ResepMakananState> {
  ResepMakananCubit() : super(ResepMakananInitial());

  // Tambahakan Cubit ResepMakananRequest
  final ResepMakananRequest resepMakananRequest = ResepMakananRequest();

  // Tambahakan Model ResepMakananModel
  ResepMakananModel resepMakananModel = ResepMakananModel();

  // Tambahakan Model DetailResepMakananModel
  DetailResepMakananModel detailResepMakananModel = DetailResepMakananModel();

  // Tambahakan Function getDataResepMakanan yang akan digunanan nanti di Screen
  getDataResepMakanan() async {
    emit(ResepMakananInitial());
    resepMakananModel = await resepMakananRequest.getResepMakanan();
    emit(DataResepMakanan(resepMakananModel));
  }

  // Tambahakan Function getDetailDataResepMakanan yang akan digunanan nanti di Screen
  getDetailDataResepMakanan(String key) async {
    emit(ResepMakananInitial());
    detailResepMakananModel =
        await resepMakananRequest.getDetailResepMakanan(key);
    emit(DataDetailResepMakanan(detailResepMakananModel));
  }
}
