class HomeStats {
  final int cases;
  final int deaths;
  final int recovered;
  final int todayCases;
  final int todayDeaths;
  final int todayRecovered;
  final String latestUpdated;
  HomeStats(
      {required this.cases,
      required this.latestUpdated,
      required this.deaths,
      required this.recovered,
      required this.todayCases,
      required this.todayDeaths,
      required this.todayRecovered});

  factory HomeStats.fromJSON(Map<String, dynamic> json) {
    return HomeStats(
      cases: json['update']['total']['jumlah_positif'],
      deaths: json['update']['total']['jumlah_meninggal'],
      recovered: json['update']['total']['jumlah_sembuh'],
      latestUpdated: json['update']['penambahan']['created'],
      todayCases: json['update']['penambahan']['jumlah_positif'],
      todayDeaths: json['update']['penambahan']['jumlah_meninggal'],
      todayRecovered: json['update']['penambahan']['jumlah_sembuh'],
    );
  }
}
