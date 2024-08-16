import 'package:flutter/material.dart';
import 'package:plantsnap/Screens/loginscreen.dart';
// import 'package:plantsnap/Screens/regscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plantsnap/widgetree.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: Widgetree(),
  ));

}
 