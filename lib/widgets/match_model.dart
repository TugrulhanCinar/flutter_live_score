import 'package:flutter/material.dart';
import 'package:flutter_canli_skor/model/live_score_model.dart';
import 'file:///E:/flutterProject/flutter_canli_skor/lib/extensions/context_extension.dart';
import 'file:///E:/flutterProject/flutter_canli_skor/lib/extensions/color_extension.dart';
import 'mac_card_widget.dart';

// ignore: must_be_immutable
class MatchModelWidget extends StatelessWidget {
  final Match currentMatch;
  final BuildContext context;
  Maclar _currentMaclar;
  final scroolController = ScrollController();

  MatchModelWidget({Key key, this.currentMatch, this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ligTitleText,
        buildMaclarListView,
      ],
    );
  }

  Container get  ligTitleText => Container(
        color: ThemeData.light().colorScheme.ligTitleBackGroundColor,
        width: MediaQuery.of(context).size.width,
        height: context.listTitleSize,
        alignment: Alignment.centerLeft,
        padding: context.titleTextPadding,
        child: Text(
          currentMatch.lig,
          style: context.theme.textTheme.subtitle2,
        ),
      );

  ListView get buildMaclarListView => ListView.separated(
        shrinkWrap: true,
        itemCount: currentMatch.maclar.length,
        controller: scroolController,
        itemBuilder: (BuildContext context, int index) {
          _currentMaclar = currentMatch.maclar[index];
          return MacCardWidget(
            context: context,
            currentMaclar: _currentMaclar,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return context.customDivider;
        },
      );
}
