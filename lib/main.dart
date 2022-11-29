import 'package:flutter/cupertino.dart';

import 'package:jig/app.dart';
import 'package:jig/firebase_options.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/services/ThemePreferences.dart';
import 'package:jig/ui/services/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseDeepLink().fetchFirebaseDynamicLink();
  configureDependencies();

  await ThemePreferences.init();

  runApp(const MyApp());
}
