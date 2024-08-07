import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrResult extends StatelessWidget {
   QrResult({super.key, required this.closeScreen, required this.code});

  @override
  final Color primaryColor = const Color(0xff344e41);

  final Color secondaryColor = const Color(0xff588157);

  final Color TernaryColor = const Color(0xff3a5a40);

  final Color backaground = const Color(0xffffffff);


  final String code;
  final Function() closeScreen;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backaground,
      appBar: AppBar(
        backgroundColor: backaground,
        title: const Text(
          "Qr Code Results",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: code,
              version: QrVersions.auto,
              size: 320,
              gapless: false,
            ),
            const Text(
              "Qr Code Results",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$code",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Copy"))
          ],
        ),
      ),
    );
  }
}
