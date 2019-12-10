import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/app_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MyHomePage(title: 'L10n DateTime Experiment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateFormat dateFormat;
  DateFormat timeFormat;
  DateTime currentDate;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        currentDate = DateTime.now();
      });
    });
    currentDate = DateTime.now();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dateFormat = DateFormat.MMMMEEEEd(Localizations.localeOf(context).toString());
    timeFormat = DateFormat.Hms(Localizations.localeOf(context).toString());
    final DateTime dateTime = DateTime(2020, 3, 19);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context).springBegins(dateFormat.format(dateTime))),
            Text('Current Time: ${timeFormat.format(currentDate)}'),
          ],
        ),
      ),
    );
  }
}