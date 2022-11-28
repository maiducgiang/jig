import 'dart:ui';

import 'package:flutter/material.dart';

enum TestStatus { doing, stop, end }

enum ResultStatus { pass, check, doing, fail }

extension ResultStatusExt on ResultStatus {
  String display() {
    switch (this) {
      case ResultStatus.pass:
        return 'PASS';
      case ResultStatus.doing:
        return "Đang kiểm tra";
      case ResultStatus.fail:
        return "FAIL:DỪNG TEST";
      case ResultStatus.check:
        return "CHECK";
    }
  }

  Color color() {
    switch (this) {
      case ResultStatus.pass:
        return const Color(0xff0DC301);
      case ResultStatus.doing:
        return Colors.grey;
      case ResultStatus.fail:
        return const Color(0xffEB5757);
      case ResultStatus.check:
        return Colors.grey;
    }
  }
}

enum SelectTestStatus { selected, select, notSelect }

extension SelectStatusExt on SelectTestStatus {
  Color color() {
    switch (this) {
      case SelectTestStatus.select:
        return const Color(0xff0079D7);
      case SelectTestStatus.selected:
        return const Color(0xff0DC301);
      case SelectTestStatus.notSelect:
        return const Color(0xffCCCBCB);
    }
  }
}
