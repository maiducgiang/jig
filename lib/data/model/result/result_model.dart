import 'package:flutter/material.dart';

class ResultModel {
  final String title;
  final String result;
  final bool status;
  Color colorResult;
  ResultModel(
      {required this.result,
      required this.title,
      required this.status,
      this.colorResult = Colors.black});
}
