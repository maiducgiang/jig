
import 'package:flutter/material.dart';
import '../../../../injection.dart';
import '../../../app_cubit.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, this.isMain = true}) : super(key: key);
  final bool? isMain;
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final appCubit = getIt.get<AppCubit>();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Noti"),
      ),
    );
  }
}
