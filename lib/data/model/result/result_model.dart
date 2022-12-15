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
  ResultModel copyWith({
    String? title,
    String? result,
    bool? status,
    Color? colorResult,
  }) {
    return ResultModel(
        title: title ?? this.title,
        result: result ?? this.result,
        status: status ?? this.status,
        colorResult: colorResult ?? this.colorResult);
  }
}
