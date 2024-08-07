import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:plantsnap/Screens/home.dart';
import 'package:plantsnap/Screens/loginscreen.dart';
import 'package:plantsnap/auth.dart';
import 'package:plantsnap/Screens/homepage.dart';
import 'package:plantsnap/Screens/regscreen.dart';

class Widgetree extends StatefulWidget {
  const Widgetree({super.key});

  @override
  State<Widgetree> createState() => _WidgetreeState();
}

class _WidgetreeState extends State<Widgetree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Authantication().userstatechange,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Home();
        } else {
          return const loginScreen();
        }
      },
    );
  }
}
