import 'package:flutter/material.dart';
import 'package:flutter_canli_skor/model/live_score_model.dart';
import 'file:///E:/flutterProject/flutter_canli_skor/lib/extensions/context_extension.dart';
import 'file:///E:/flutterProject/flutter_canli_skor/lib/extensions/color_extension.dart';
import 'package:web_socket_channel/io.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LiveScore _liveScore;
  Match _currentMatch;
  final scroolController = ScrollController();
  final _titleText = "Live Score";
  Maclar _currentMaclar;
  final socetURL = "";
  final _socet = IOWebSocketChannel.connect(socetURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _streamBuilder,
    );
  }

  Widget get _appBar => AppBar(
      title: _appBarText,
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.appBarColor);

  Widget get _appBarText => Text(
        _titleText,
        style: context.theme.textTheme.headline1,
      );

  Widget get _streamBuilder => StreamBuilder(
        stream: _socet.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            _liveScore = LiveScore.stringToJson(snapshot.data);
            return buildLigListView();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );

  ListView buildLigListView() => ListView.builder(
        shrinkWrap: true,
        controller: scroolController,
        itemCount: _liveScore.matches.length,
        itemBuilder: (BuildContext context, int index) {
          _currentMatch = _liveScore.matches[index];
          return ligTitleAndMaclar();
        },
      );

  Column ligTitleAndMaclar() {
    return Column(
      children: [
        ligTitleText(),
        buildMaclarListView(),
      ],
    );
  }

  Container ligTitleText() {
    return Container(
      color: ThemeData.light().colorScheme.ligTitleBackGroundColor,
      width: MediaQuery.of(context).size.width,
      height: context.listTitleSize,
      alignment: Alignment.centerLeft,
      padding: context.titleTextPadding,
      child: Text(_currentMatch.lig, style: context.theme.textTheme.subtitle2),
    );
  }

  ListView buildMaclarListView() => ListView.separated(
        shrinkWrap: true,
        itemCount: _currentMatch.maclar.length,
        controller: scroolController,
        itemBuilder: (BuildContext context, int index) {
          _currentMaclar = _currentMatch.maclar[index];
          return macCardWidget;
        },
        separatorBuilder: (BuildContext context, int index) {
          return context.customDivider;
        },
      );


  ListTile get macCardWidget => ListTile(
      title: _macCardWidgetTitle, subtitle: _subtitleText(_currentMaclar.kick));

  Widget get _macCardWidgetTitle => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 15,
            child: _text(_currentMaclar.status),
          ),
          Expanded(
            flex: 30,
            child: _text(_currentMaclar.home),
          ),
          Expanded(
            flex: 15,
            child: _text(_currentMaclar.score),
          ),
          Expanded(
            flex: 30,
            child: _text(_currentMaclar.away),
          ),
          Expanded(
            flex: 10,
            child: _subtitleText(_currentMaclar.halftime),
          ),
        ],
      );

  Widget _subtitleText(String text) =>
      Text(text, style: context.theme.textTheme.bodyText2);

  Widget _text(String text) => Text(text,
      style: context.theme.textTheme.bodyText1, textAlign: TextAlign.center);
}
