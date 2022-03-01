import 'package:infocovid/api/covid_api.dart';
import 'package:infocovid/api/indonesia_covid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

const url = 'https://github.com/ronaldichandra/covid19-app';
launchUrl() async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final f = NumberFormat('#,###,###');

    return Scaffold(
      body: FutureBuilder<IndonesiaStat>(
          future: CovidAPI().getIndonesiaData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Periksa koneksi anda! 🙅‍♂️',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(120, 50),
                                onPrimary: Color(0xff001A43),
                                primary: Color(0xffACC7FF),
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text(
                              'Refresh',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            )),
                      )
                    ],
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0)),
                      child: Container(
                        height: 300.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 70.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 32.0, left: 32.0),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text('Perkembangan',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                )),
                            Container(
                                alignment: Alignment.center,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    'COVID-19 Indonesia',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                )),
                            Container(
                                alignment: Alignment.center,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    'Last update: ${snapshot.data!.latestUpdated} WIB',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(Icons.refresh),
                                onPressed: () {
                                  setState(() {
                                    //You can also make changes to your state here.
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 240.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 32.0, left: 32.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18.0, left: 14.0, bottom: 18.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                          alignment: Alignment.centerRight,
                                          padding: EdgeInsets.only(right: 20.0),
                                          child: Text(
                                            '🤒',
                                            style: TextStyle(fontSize: 30.0),
                                          )),
                                      Container(
                                        child: Text(
                                          'Kasus aktif',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 25.0),
                                        child: Text(
                                          '${f.format(snapshot.data?.cases)}',
                                          style: TextStyle(
                                              fontSize: 50.0,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 90.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${f.format(snapshot.data?.todayCases)}',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimaryContainer,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Icon(
                                              Icons.arrow_upward,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Container(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, left: 14.0, bottom: 18.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                            alignment: Alignment.centerRight,
                                            padding:
                                                EdgeInsets.only(right: 20.0),
                                            child: Text(
                                              '😄',
                                              style: TextStyle(fontSize: 30.0),
                                            )),
                                        Container(
                                          child: Text(
                                            'Sembuh',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 25.0),
                                          child: Text(
                                            '${f.format(snapshot.data?.recovered)}',
                                            style: TextStyle(
                                                fontSize: 50.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 90.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                '${f.format(snapshot.data?.todayRecovered)}',
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondaryContainer,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Icon(
                                                Icons.arrow_upward,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                color: Theme.of(context).colorScheme.secondary,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18.0, left: 14.0, bottom: 18.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                          alignment: Alignment.centerRight,
                                          padding: EdgeInsets.only(right: 20.0),
                                          child: Text(
                                            '😢',
                                            style: TextStyle(fontSize: 30.0),
                                          )),
                                      Container(
                                        child: Text(
                                          'Meninggal',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 25.0),
                                        child: Text(
                                          '${f.format(snapshot.data?.deaths)}',
                                          style: TextStyle(
                                              fontSize: 50.0,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 90.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${f.format(snapshot.data?.todayDeaths)}',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Icon(
                                              Icons.arrow_upward,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 20.0, bottom: 70.0),
                              child: Text(
                                  'Note: Data harian COVID-19 biasanya update pada sekitar pukul 17.00 WIB'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchUrl();
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          FontAwesome.github,
          color: Theme.of(context).hintColor,
        ),
      ),
    );
  }
}
