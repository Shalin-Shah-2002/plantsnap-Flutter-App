import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plantsnap/Screens/qr_result.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScanner extends StatefulWidget {
  QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  bool scanComplete = false;
  final Color primaryColor = const Color(0xff344e41);

  final Color secondaryColor = const Color(0xff588157);

  final Color TernaryColor = const Color(0xff3a5a40);

  final Color backaground = const Color(0xffffffff);

  // final Barcode barcode =  Barcode().rawValue;
  final TextEditingController _controller = TextEditingController();
  String _qrData = "";
  void closeScanner() {
    scanComplete = false;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backaground,
        appBar: AppBar(
          backgroundColor: backaground,
          bottom: TabBar(
            labelColor: primaryColor,
            indicatorColor: secondaryColor,
            tabs: [
              Tab(text: "Scanner"),
              Tab(text: "Genretor"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // First tab content
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Place QR code here",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text("Scanning will start Automatically")
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: MobileScanner(
                        allowDuplicates: true,
                        onDetect: (barcode, args) {
                          if (!scanComplete) {
                            String code = barcode.rawValue ?? '---';
                            print(code);
                            scanComplete = true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QrResult(
                                    code: code,
                                    closeScreen: closeScanner,
                                  ),
                                ));
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      color: backaground,
                      child: const Text("Developed by Shalin"),
                    ),
                  )
                ],
              ),
            ),
            // Second tab content
            Center(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter data',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _qrData = _controller.text;
                      });
                    },
                    child: Text('Generate QR Code'),
                  ),
                  SizedBox(height: 20),
                  _qrData.isNotEmpty
                      ? QrImageView(
                          data: _qrData,
                          version: QrVersions.auto,
                          size: 250,
                        )
                      : Container(),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
