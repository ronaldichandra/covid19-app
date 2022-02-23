import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:covid_data/model/indonesia_data_model.dart';

class CovidAPI {
  Future<HomeStats> getIndonesiaData() async {
    String url = 'https://data.covid19.go.id/public/api/update.json';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonRes = json.decode(response.body);
      return HomeStats.fromJSON(jsonRes);
    } else {
      throw Exception("Gagal untuk load");
    }
  }
}
