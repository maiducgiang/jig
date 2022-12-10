import 'package:flutter/cupertino.dart';
import 'package:jig/app.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/services/ThemePreferences.dart';
import 'package:sp_util/sp_util.dart';

void main() async {
  await SpUtil.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseDeepLink().fetchFirebaseDynamicLink();
  configureDependencies();

  await ThemePreferences.init();

  runApp(const MyApp());
}
