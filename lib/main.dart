import 'package:flutter/material.dart';
import 'package:flutter_canli_skor/app/home_page.dart';

void main() {
  runApp(LiveScoreApp());
}

class LiveScoreApp extends StatelessWidget {
  final _title = 'Canlı Skor';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme().copyWith(
          headline1: _headline1,
          bodyText1: _bodyText1,
          bodyText2: _bodyText2,
          subtitle1: _subTitle1,
          subtitle2: _subtitle2,
        ),
      ),
      home: HomePage(),
    );
  }

  TextStyle get _bodyText1 => TextStyle(color: Colors.black, fontSize: 16);

  TextStyle get _bodyText2 => TextStyle(color: Colors.grey);

  TextStyle get _subTitle1 => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontSize: 16,
      );

  TextStyle get _subtitle2 => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontSize: 16,
      );

  TextStyle get _headline1 => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontStyle: FontStyle.italic,
      );
}
