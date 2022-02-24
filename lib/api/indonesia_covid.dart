class IndonesiaStat {
  final int cases;
  final int deaths;
  final int recovered;
  final int todayCases;
  final int todayDeaths;
  final int todayRecovered;
  final String latestUpdated;

  IndonesiaStat(
      {required this.cases,
      required this.deaths,
      required this.recovered,
      required this.todayCases,
      required this.todayDeaths,
      required this.todayRecovered,
      required this.latestUpdated});

  factory IndonesiaStat.fromJSON(Map<String, dynamic> json) {
    return IndonesiaStat(
      cases: json['update']['total']['jumlah_positif'],
      deaths: json['update']['total']['jumlah_meninggal'],
      recovered: json['update']['total']['jumlah_sembuh'],
      latestUpdated: json['update']['penambahan']['tanggal'],
      todayCases: json['update']['penambahan']['jumlah_positif'],
      todayDeaths: json['update']['penambahan']['jumlah_meninggal'],
      todayRecovered: json['update']['penambahan']['jumlah_sembuh'],
    );
  }
}
