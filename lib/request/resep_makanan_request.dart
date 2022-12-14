import 'package:dio/dio.dart';
import 'package:resepmakanan/model/detail_resep_makanan_model.dart';

import '../model/resep_makanan_model.dart';

class ResepMakananRequest {
  // Tambahkan Function untuk request untuk Data Resep Makanan
  Future<ResepMakananModel> getResepMakanan() async {
    Response response = await Dio()
        .get('https://masak-apa-tomorisakura.vercel.app/api/recipes');
    return ResepMakananModel.fromJson(response.data);
  }

  // Tambahkan Function untuk request untuk Data Detail Resep Makanan
  Future<DetailResepMakananModel> getDetailResepMakanan(String key) async {
    Response response = await Dio()
        .get('https://masak-apa-tomorisakura.vercel.app/api/recipe/' + key);
    return DetailResepMakananModel.fromJson(response.data);
  }
}
