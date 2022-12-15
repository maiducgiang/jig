import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/repository/auth/auth_repository.dart';
import 'package:jig/data/repository/main/main_repository.dart';
import 'package:jig/data/setup_data_port/setup_data_port.dart';
import 'package:jig/ui/screen/main/setting/cubit/setting_state.dart';
import 'package:serial_port_win32/serial_port_win32.dart';
import 'package:sp_util/sp_util.dart';

class SettingCubit extends Cubit<SettingState> {
  final AuthRepository _apiAuth;

  final MainRepository _apiMain;
  late SerialPort port;
  SettingCubit(this._apiAuth, this._apiMain) : super(SettingState.initial());

  Future<void> getData() async {
    emit(state.copyWith(isLoading: true));
    List<String> ports = [];
    ports = SerialPort.getAvailablePorts();
    emit(state.copyWith(isLoading: false, comPorts: ports));
  }

  void saveInforOpenPort({
    required String namePort,
    required int baudRate,
    required int parity,
    required int stopBits,
    required int byteSize,
    required int readIntervalTimeout,
    required int readTotalTimeoutConstant,
    required int readTotalTimeoutMulti,
  }) async {
    SetupDataPortModel info = SetupDataPortModel(
        namePort: namePort,
        baudRate: baudRate,
        byteSize: byteSize,
        parity: parity,
        readIntervalTimeout: readIntervalTimeout,
        readTotalTimeoutConstant: readTotalTimeoutConstant,
        readTotalTimeoutMulti: readTotalTimeoutMulti,
        stopBits: stopBits);
    SpUtil.putObject("SetupDataPortModel", info);
  }

  Future<void> openPort({
    required String namePort,
    required int baudRate,
    required int parity,
    required int stopBits,
    required int byteSize,
    required int readIntervalTimeout,
    required int readTotalTimeoutConstant,
    required int readTotalTimeoutMulti,
  }) async {
    //if (port != null || port!.isOpened == true) port!.close();
    port = SerialPort(namePort,
        openNow: true,
        BaudRate: baudRate,
        Parity: parity,
        StopBits: stopBits,
        ByteSize: byteSize,
        ReadIntervalTimeout: readIntervalTimeout,
        ReadTotalTimeoutConstant: readTotalTimeoutConstant,
        ReadTotalTimeoutMultiplier: readTotalTimeoutMulti);
    port.readBytesSize = 50;
    if (port.isOpened == false) port.open();
    // port.readOnListenFunction = ((value) {
    //   emit(state.copyWith(dataReceive: String.fromCharCodes(value)));
    //   print("read: 1 " + String.fromCharCodes(value));
    // });

    print("connect ${port.isOpened == true ? "success" : "fail"}");
    emit(state.copyWith(isActive: port.isOpened));
    handleReceived();
  }

  Future<void> closePort() async {
    port.close();
    emit(state.copyWith(isActive: false));
  }

  Future<bool> sendData(String message) async {
    if (port.isOpened == false) port.open();
    print(utf8.encode(message));
    //bug: send + utf8 = [0] last message
    // bool check = port.writeBytesFromString(message);
    bool check =
        port.writeBytesFromUint8List(Uint8List.fromList(utf8.encode(message)));
    print("send message: ${message} " + (check == false ? "fail" : "success"));

    return check;
  }

  Future<void> handleReceived() async {
    //if (state.isActive == true) {
    //if (port.isOpened == false) port.open();
    //print(port.isOpened);
    //port.readOnListenFunction;
    String s = "";
    if (state.isActive == true) {
      port.readBytesOnListen(1024, (value) {
        //print("read" + value.toString() + "\n");
        print("read 2 ${port.portName}:${String.fromCharCodes(value)}\n");
        s += String.fromCharCodes(value);
        //String str = "#@F&L^&%U##T#T@#ER###CA@#@M*(PU@&#S%^%2324@*(^&";
        s = s.replaceAll(RegExp('[^ -~\n]'), '');
        emit(state.copyWith(dataReceive: s));
      });
    }
  }
}
