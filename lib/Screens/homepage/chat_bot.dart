import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plantsnap/Screens/home.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final Color primaryColor = const Color(0xff344e41);
  final Color secondaryColor = const Color(0xff588157);
  final Color ternaryColor = const Color(0xff3a5a40);
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatBot'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.black,
            width: 200,
            height: 200,
          ),
          const Spacer(),
          Container(
            height: 50,
            width: 400,
            child: TextField(),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: primaryColor,
            ),
          ),
        ],
      )),
    );
  }
}
