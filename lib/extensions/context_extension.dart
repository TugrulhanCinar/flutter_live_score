import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;

  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  ThemeData get theme => Theme.of(this);
}

extension NumberExtension on BuildContext {
  double get lowValue => dynamicHeight(0.003);

  double get lowMediumValue => dynamicHeight(0.015);

  double get mediumValue => dynamicHeight(0.005);

  double get highValue => dynamicHeight(0.05);

  double get high2Value => dynamicHeight(0.1);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllLow => EdgeInsets.all(lowValue);

  EdgeInsets get titleTextPadding => EdgeInsets.only(left: lowMediumValue);
}

extension DividergExtension on BuildContext {
  Widget get customDivider => Divider(
        color: Colors.red,
        height: mediumValue,
      );
}

extension listTitle on BuildContext {
  double get listTitleSize =>
      MediaQuery.of(this).orientation == Orientation.portrait
          ? highValue
          : high2Value;
}

extension EmptyWidget on BuildContext {
  Widget get emptyWidgetHeight => SizedBox(
        height: lowValue,
      );
}
