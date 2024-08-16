import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ChatBot extends StatefulWidget {
  ChatBot({super.key, this.resizableWidget});
  late bool? resizableWidget;

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final Color primaryColor = const Color(0xff344e41);
  final Color secondaryColor = const Color(0xff588157);
  final Color ternaryColor = const Color(0xff3a5a40);
  late bool? resize;

  @override
  void initState() {
    super.initState();
    resize = widget.resizableWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatBot'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: AspectRatio(
                          aspectRatio: 0.55,
                          child: Container(
                            decoration: BoxDecoration(
                              color: ternaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundColor: secondaryColor,
                            child: IconButton(
                              icon: const Icon(Icons.send, size: 20),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
