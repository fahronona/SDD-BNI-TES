import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bni_sdd/data/model/promo_model.dart';

class PromoService {
  final Dio dio = Dio();
  Future<PromoModel> getPromo() async {
    try {
      final String apiUrl = 'https://content.digi46.id/promos';
      final Map<String, String> headers = {
        'Authorization': '',
      };

      final response = await dio.get(
        apiUrl,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        // data.forEach((key, value) {

        // });
        print(data);
        return PromoModel.fromJson(data);
      } else {
        throw Exception('Gagal mengambil data cuaca');
      }
    } catch (e) {
      throw Exception('Gagal mendapatkan promo: $e');
    }
  }

  Future<List<PromoModel>> getDummyData() async {
    final String response =
        await rootBundle.loadString('assets/data_dummy.json');
    final data = await jsonDecode(response);
    List<PromoModel> res = [];
    (data as List).forEach((e) {
      res.add(PromoModel.fromJson(e));
    });

    return res;
  }
}
