import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/repository/main/main_repository.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/base_screen.dart';
import 'package:jig/ui/loading_screen.dart';
import 'package:jig/ui/screen/main/home/cubit/home_cubit.dart';
import 'package:jig/ui/screen/main/home/cubit/home_state.dart';
import 'package:jig/ui/screen/main/home/widget/dropdown.dart';
import 'package:jig/ui/shared/widget/button/primary_button.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';
import 'package:jig/ui/shared/widget/text_field/text_form_field.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';
import '../../../../data/repository/auth/auth_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String selectPortCom = " ";
  final TextEditingController messSendController = TextEditingController();
  late String baudRateController = "115200";
  late String parityController = "0";
  late String stopBitsController = "0";
  late TextEditingController byteSizeController =
      TextEditingController(text: "8");
  late TextEditingController readIntervalTimeoutController =
      TextEditingController(text: "10");
  late TextEditingController readTotalTimeoutConstantController =
      TextEditingController(text: "1");
  late TextEditingController readTotalTimeoutMultiplierController =
      TextEditingController(text: "0");
  @override
  void initState() {
    super.initState();
  }

  // bool _send(String port, String message) {
  //   SerialPort port2 = SerialPort(port,
  //       openNow: true, ReadIntervalTimeout: 1, ReadTotalTimeoutConstant: 2);
  //   if (port2.isOpened == false) port2.open();
  //   var check = port2.writeBytesFromString(message);
  //   port2.close();
  //   return check;
  // }

  // void received(String comPort) {}

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: body(context),
    ));
  }

  Widget body(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        getIt.get<AuthRepository>(),
        getIt.get<MainRepository>(),
      )..getData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          state.isActive == true
              ? getIt.get<IToast>().show(
                  title: 'Thông báo',
                  message: 'Connect success',
                  hasDismissButton: true,
                  duration: const Duration(milliseconds: 1000))
              : getIt.get<IToast>().show(
                  title: 'Thông báo',
                  message: 'Disconnect',
                  hasDismissButton: false,
                  duration: const Duration(milliseconds: 1000));
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingScreen();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text(
                            "COM Port:",
                            style: primaryTitleStyle.copyWith(fontSize: 22),
                          ),
                        ),
                        DropdowCom(
                          comPorts: state.comPorts!,
                          callback: ((data) {
                            // context.read<HomeCubit>().closePort();
                            // context.read<HomeCubit>().handleReceived(data);
                            setState(() {
                              selectPortCom = data;
                            });
                          }),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text(
                            "BaudRate:",
                            style: primaryTitleStyle.copyWith(fontSize: 22),
                          ),
                        ),
                        DropdowCom(
                          comPorts: baudRateList,
                          callback: ((data) {
                            // context.read<HomeCubit>().closePort();
                            // context.read<HomeCubit>().handleReceived(data);
                            setState(() {
                              baudRateController = data;
                            });
                          }),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text(
                            "Parity:",
                            style: primaryTitleStyle.copyWith(fontSize: 22),
                          ),
                        ),
                        DropdowCom(
                          comPorts: parityList,
                          callback: ((data) {
                            // context.read<HomeCubit>().closePort();
                            // context.read<HomeCubit>().handleReceived(data);
                            setState(() {
                              parityController = data;
                            });
                          }),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text(
                            "StopBits:",
                            style: primaryTitleStyle.copyWith(fontSize: 22),
                          ),
                        ),
                        DropdowCom(
                          comPorts: stopBitsList,
                          callback: ((data) {
                            // context.read<HomeCubit>().closePort();
                            // context.read<HomeCubit>().handleReceived(data);
                            setState(() {
                              stopBitsController = data;
                            });
                          }),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            "Read Total Timeout Constant:",
                            style: primaryTitleStyle.copyWith(fontSize: 22),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: TextFormFieldInput(
                              controller: readTotalTimeoutConstantController,
                              hinText: ""),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Row(
                      children: [
                        Text(
                          "Read Total Timeout Multiplier:",
                          style: primaryTitleStyle.copyWith(fontSize: 22),
                        ),
                        SizedBox(
                          width: 200,
                          child: TextFormFieldInput(
                              controller: readTotalTimeoutMultiplierController,
                              hinText: ""),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "ByteSize:",
                          style: primaryTitleStyle.copyWith(fontSize: 22),
                        ),
                        SizedBox(
                          width: 200,
                          child: TextFormFieldInput(
                              controller: byteSizeController, hinText: ""),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Row(
                      children: [
                        Text(
                          "Read Interval Timeout: ",
                          style: primaryTitleStyle.copyWith(fontSize: 22),
                        ),
                        SizedBox(
                          width: 200,
                          child: TextFormFieldInput(
                              controller: readIntervalTimeoutController,
                              hinText: ""),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 110,
                      child: Text(
                        "Message send:",
                        style: primaryTitleStyle.copyWith(fontSize: 22),
                      ),
                    ),
                    Expanded(
                      child: TextFormFieldInput(
                          controller: messSendController,
                          maxLine: 5,
                          hinText: ""),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PrimaryButton(
                      label: "Send message",
                      onPressed: (() async {
                        bool check = await context
                            .read<HomeCubit>()
                            .sendData(messSendController.text);
                        //_send(selectPortCom, messSendController.text)
                        check
                            ? getIt.get<IToast>().show(
                                title: 'Thông báo',
                                message: 'Send success',
                                hasDismissButton: true,
                                duration: const Duration(milliseconds: 1000))
                            : getIt.get<IToast>().show(
                                title: 'Thông báo',
                                message: 'Send fail',
                                hasDismissButton: false,
                                duration: const Duration(milliseconds: 1000));
                      }),
                    ),
                    PrimaryButton(
                      label: "Refresh COM port",
                      onPressed: (() {
                        context.read<HomeCubit>().getData();
                      }),
                    ),
                    PrimaryButton(
                      label: "Connect",
                      onPressed: (() {
                        if (selectPortCom == " ") {
                          selectPortCom = state.comPorts![0];
                        }
                        context.read<HomeCubit>().openPort(
                            namePort: selectPortCom,
                            baudRate: int.parse(baudRateController),
                            parity: int.parse(parityController),
                            stopBits: int.parse(stopBitsController),
                            byteSize: int.parse(byteSizeController.text),
                            readIntervalTimeout:
                                int.parse(readIntervalTimeoutController.text),
                            readTotalTimeoutConstant: int.parse(
                                readTotalTimeoutConstantController.text),
                            readTotalTimeoutMulti: int.parse(
                                readTotalTimeoutMultiplierController.text));
                      }),
                    ),
                    PrimaryButton(
                      label: "Disconnect",
                      onPressed: (() {
                        context.read<HomeCubit>().closePort();
                      }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 110,
                      child: Text(
                        "Message received:",
                        style: primaryTitleStyle.copyWith(fontSize: 22),
                      ),
                    ),
                    Expanded(
                      child: TextFormFieldInput(
                          controller:
                              TextEditingController(text: state.dataReceive),
                          maxLine: 5,
                          hinText: ""),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}


// class MyApp2 extends StatelessWidget {
//   const MyApp2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<String> available = SerialPort.availablePorts;
//     print("Available: $available");
//     String port = "COM1";
//     SerialPort port1 = SerialPort(port);
//     port1.openReadWrite();
//     try {
//       print("writen byte: $port ${port1.write(_stringToUint8List('hello'))}");
//       SerialPortReader reader = SerialPortReader(port1);
//       Stream<String> upcoming = reader.stream.map((data) {
//         return String.fromCharCodes(data);
//       });
//       upcoming.listen((data) {
//         print('read data: ${data}');
//       });
//     } on SerialPortError catch (err, _) {
//       print(SerialPort.lastError);
//       port1.close();
//     }
//     return Container();
//   }

//   Uint8List _stringToUint8List(String s) {
//     List<int> code = s.codeUnits;
//     Uint8List uint8list = Uint8List.fromList(code);
//     return uint8list;
//   }
// }
