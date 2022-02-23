import 'package:covid_data/api/covid_api.dart';
import 'package:covid_data/model/indonesia_data_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final f = NumberFormat("#,###,###");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 35.0, right: 35.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder<HomeStats>(
                  future: CovidAPI().getIndonesiaData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Center(child: CircularProgressIndicator()));
                    } else {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            alignment: Alignment.center,
                            child: Text(
                              'COVID-19 Indonesia',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 50.0),
                            child: Text(
                                'Pembaruan terakhir: ${snapshot.data?.latestUpdated}'),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                height: 170,
                                color: Color(0xffFFDCC3),
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Kasus aktif:',
                                          style: TextStyle(
                                              color: Color(0xff944B00),
                                              fontSize: 30.0),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${f.format(snapshot.data?.cases)}',
                                          style: TextStyle(
                                              color: Color(0xff944B00),
                                              fontSize: 50.0,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${f.format(snapshot.data?.todayCases)} (+)',
                                          style: TextStyle(
                                            color: Color(0xff944B00),
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                height: 170,
                                color: Color(0xff97F7B8),
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Total sembuh:',
                                          style: TextStyle(
                                              color: Color(0xff006D3C),
                                              fontSize: 30.0),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${f.format(snapshot.data?.recovered)}',
                                          style: TextStyle(
                                              color: Color(0xff006D3C),
                                              fontSize: 50.0,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${f.format(snapshot.data?.todayRecovered)} (+)',
                                          style: TextStyle(
                                            color: Color(0xff006D3C),
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                height: 170,
                                color: Color(0xffFFDAD3),
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Total meninggal:',
                                          style: TextStyle(
                                              color: Color(0xffC10000),
                                              fontSize: 30.0),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${f.format(snapshot.data?.deaths)}',
                                          style: TextStyle(
                                              color: Color(0xffC10000),
                                              fontSize: 50.0,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${f.format(snapshot.data?.todayDeaths)} (+)',
                                          style: TextStyle(
                                            color: Color(0xffC10000),
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text('Made with ❤️ by Ronaldi Chandra Karuna'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
