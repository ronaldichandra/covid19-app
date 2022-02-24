import 'package:http/http.dart' as http;
import 'dart:convert';
import 'indonesia_covid.dart';

class CovidAPI {
  Future<IndonesiaStat> getIndonesiaData() async {
    String url = 'https://data.covid19.go.id/public/api/update.json';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return IndonesiaStat.fromJSON(json.decode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
