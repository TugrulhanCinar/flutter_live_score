import 'package:flutter/material.dart';
import 'package:flutter_canli_skor/model/live_score_model.dart';
import 'package:flutter_canli_skor/widgets/match_model.dart';
import '../search.dart';
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
  List<Maclar> _allCurrentMatch = List();
  final _titleText = "Live Score";
  bool hasMaclarData;
   final String _socetURL = "";
  final _socet = IOWebSocketChannel.connect(_socetURL);

  @override
  void initState() {
    super.initState();
    hasMaclarData = false;
  }

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
      actions: _appBarActions,
      backgroundColor: Theme.of(context).colorScheme.appBarColor);

  Widget get _appBarText =>
      Text(_titleText, style: context.theme.textTheme.headline1);

  List<Widget> get _appBarActions => [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            addAllCurrentMatch();
            showSearch(
              context: context,
              delegate: MacsItemsSearch(
                _allCurrentMatch,
              ),
            );
          },
        )
      ];

  Widget get _streamBuilder => StreamBuilder(
        stream: _socet.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            _liveScore = LiveScore.stringToJson(snapshot.data);
            if (!hasMaclarData) {
              addAllCurrentMatch();
            }
            return buildLigListView;
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );

  addAllCurrentMatch() {
    _allCurrentMatch =
        _liveScore.matches.expand((element) => element.maclar).toList();
    hasMaclarData = true;
  }

  ListView get buildLigListView => ListView.builder(
        shrinkWrap: true,
        itemCount: _liveScore.matches.length,
        itemBuilder: (BuildContext context, int index) {
          _currentMatch = _liveScore.matches[index];
          return MatchModelWidget(
              currentMatch: _currentMatch, context: context);
        },
      );
}
