import 'package:flutter/material.dart';
import 'package:flutter_canli_skor/model/live_score_model.dart';
import 'file:///E:/flutterProject/flutter_canli_skor/lib/extensions/context_extension.dart';

class MacCardWidget extends StatelessWidget {
  final Maclar currentMaclar;
  final BuildContext context;


  const MacCardWidget({Key key,this.currentMaclar, this.context}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _macCardWidgetTitle,
      subtitle: _subtitleText(currentMaclar.kick),
    );
  }

  Widget get _macCardWidgetTitle {
    Color color = Colors.red;
    String status = currentMaclar.status;
    if (status == "MS" || status == "ERT" || status == "Pen" || status == "") {
      color = Colors.black;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 15,
          child: _text(currentMaclar.status, color),
        ),
        Expanded(
          flex: 30,
          child: _text(currentMaclar.home, Colors.black),
        ),
        Expanded(
          flex: 15,
          child: _text(currentMaclar.score, color),
        ),
        Expanded(
          flex: 30,
          child: _text(currentMaclar.away, Colors.black),
        ),
        Expanded(
          flex: 10,
          child: _subtitleText(currentMaclar.halftime),
        ),
      ],
    );
  }

  Widget _subtitleText(String text) =>
      Text(text, style: context.theme.textTheme.bodyText2);

  Widget _text(String text, Color currentColor) => Text(
    text,
    style: context.theme.textTheme.bodyText1.copyWith(color: currentColor),
    textAlign: TextAlign.center,
  );
}
