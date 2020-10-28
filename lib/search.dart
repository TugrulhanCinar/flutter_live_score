import 'package:flutter/material.dart';
import 'model/live_score_model.dart';
import 'widgets/mac_card_widget.dart';
import 'file:///E:/flutterProject/flutter_canli_skor/lib/extensions/context_extension.dart';

class MacsItemsSearch extends SearchDelegate<Maclar> {
  List<Maclar> _maclars;

  MacsItemsSearch(this._maclars);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      buildActionsIconButton
    ];
  }

  IconButton get buildActionsIconButton {
    return IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        query = "";
      },
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return buildLeadingIconButton(context);
  }

  IconButton buildLeadingIconButton(BuildContext context) {
    return IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      close(context, null);
    },
  );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? _maclars
        : _maclars
            .where(
              (element) =>
                  element.home.toUpperCase().contains(query.toUpperCase()) || element.away.toUpperCase().contains(query.toUpperCase())
            )
            .toList();
    return mylist.isEmpty
        ? buildCenter(context)
        : _buildSuggestionsListView(mylist);
  }

  Center buildCenter(BuildContext context) {
    return Center(
          child: Text('No result Found...',
              style: context.theme.textTheme.headline1
                  .copyWith(color: Colors.black)),
        );
  }

  ListView _buildSuggestionsListView(List<Maclar> mylist) {
    return ListView.separated(
          shrinkWrap: true,
          itemCount: mylist.length,
          itemBuilder: (BuildContext context, int index) {
            return MacCardWidget(
              context: context,
              currentMaclar: mylist[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return context.customDivider;
          },
        );
  }

}
