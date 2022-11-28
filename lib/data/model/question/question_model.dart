import 'package:flutter/cupertino.dart';
import 'package:jig/data/enum/enum_test_status.dart';

class Question {
  final String title;
  final Widget child;
  final SelectTestStatus status;
  final ResultStatus? resultStatus;
  Question(
      {required this.child,
      required this.title,
      this.status = SelectTestStatus.notSelect,
      this.resultStatus = ResultStatus.doing});
  Color getColorSelect() {
    return status.color();
  }
}
