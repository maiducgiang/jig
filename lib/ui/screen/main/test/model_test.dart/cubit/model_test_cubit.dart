import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jig/data/setup_data_port/setup_data_port.dart';
import 'package:jig/ui/screen/main/home/home_screen.dart';
import 'package:jig/ui/screen/main/test/model_test.dart/cubit/model_test_state.dart';
import 'package:serial_port_win32/serial_port_win32.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../../../data/enum/enum_test_status.dart';

class ModelTestCubit extends Cubit<ModelTestState> {
  ModelTestCubit() : super(ModelTestState.initial());
  late SerialPort port;
  String s = "";
  late Timer _timer1;
  Future<void> openPort() async {
    emit(state.copyWith(isLoading: true));
    SetupDataPortModel? info = SpUtil.getObj("SetupDataPortModel",
        (v) => SetupDataPortModel.fromJson(Map<String, dynamic>.from(v)));
    if (info != null) {
      port = SerialPort(info.namePort,
          openNow: true,
          BaudRate: info.baudRate,
          Parity: info.parity,
          StopBits: info.stopBits,
          ByteSize: info.byteSize,
          ReadIntervalTimeout: info.readIntervalTimeout,
          ReadTotalTimeoutConstant: info.readTotalTimeoutConstant,
          ReadTotalTimeoutMultiplier: info.readTotalTimeoutMulti);
      port.readBytesSize = 50;
      if (port.isOpened == false) port.open();
      emit(state.copyWith(isActive: port.isOpened));
      handleReceived();

      Timer(const Duration(seconds: 1), () {
        sendData("[TEST_JIG_EN,1]");
      });
      Timer(const Duration(seconds: 2), () {
        if (state.result == null) {
          emit(state.copyWith(
              result: false,
              isLoading: false,
              error: "không gửi được bài test"));
        }
      });
    } else {
      emit(state.copyWith(
          isLoading: false, error: "không kết nối tới thiết bị"));
    }
  }

  Future<void> closePort() async {
    port.close();
    emit(state.copyWith(isActive: false));
  }

  Future<bool> sendData(String message) async {
    if (port.isOpened == false) port.open();
    bool check =
        port.writeBytesFromUint8List(Uint8List.fromList(utf8.encode(message)));
    print("send message: ${message} " + (check == false ? "fail" : "success"));

    return check;
  }

  Future<void> handleReceived() async {
    port.readBytesOnListen(1024, (value) {
      //print("read 2 ${port.portName}:${String.fromCharCodes(value)}\n");
      s = s + String.fromCharCodes(value);

      if (s.contains("\$")) {
        s = s.replaceAll(RegExp('[^ -~\n]'), '');
        print("read 2 ${port.portName}:$s\n");
        if (s.contains("PASS")) {
          closePort();
          emit(state.copyWith(result: true, isLoading: false));
        } else {
          closePort();
          emit(state.copyWith(
              result: false, isLoading: false, error: "kết quả sai"));
        }
      }
    });
  }
}