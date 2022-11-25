import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jig/data/repository/auth/auth_repository.dart';
import 'package:jig/data/repository/main/main_repository.dart';
import 'package:jig/ui/screen/main/home/cubit/home_state.dart';
import 'package:serial_port_win32/serial_port_win32.dart';

const homePageAssets = "assets/data/homepage.json";

class HomeCubit extends Cubit<HomeState> {
  final AuthRepository _apiAuth;

  final MainRepository _apiMain;
  late SerialPort port;
  HomeCubit(this._apiAuth, this._apiMain) : super(HomeState.initial());

  Future<void> getData() async {
    emit(state.copyWith(isLoading: true));
    List<String> ports = [];
    ports = SerialPort.getAvailablePorts();
    emit(state.copyWith(isLoading: false, comPorts: ports));
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
    port.readBytesSize = 8;
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
    bool check = port.writeBytesFromString(message);
    print("send message: ${message} " + (check == false ? "fail" : "success"));
    return check;
  }

  Future<void> handleReceived() async {
    //if (state.isActive == true) {
    //if (port.isOpened == false) port.open();
    //print(port.isOpened);
    //port.readOnListenFunction;
    if (state.isActive == true) {
      port.readBytesOnListen(50, (value) {
        print("read 2 ${port.portName}:${String.fromCharCodes(value)}\n");
        emit(state.copyWith(dataReceive: String.fromCharCodes(value)));
      });
    }
  }
}
