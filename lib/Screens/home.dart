import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantsnap/Screens/add_records.dart';
import 'package:plantsnap/Screens/homepage/chat_bot.dart';
import 'package:plantsnap/Screens/homepage/plant_collection.dart';
import 'package:plantsnap/Screens/homepage/qr_scanner.dart';
import 'package:plantsnap/Screens/homepage/store_collection.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color primaryColor = const Color(0xff344e41);
  final Color secondaryColor = const Color(0xff588157);
  final Color ternaryColor = const Color(0xff3a5a40);
  var index = 0;
  bool isBottomNavBarVisible = true;

  _screenChange() {
    if (index == 0) {
      return const PlantCollection();
    } else if (index == 2) {
      return const StoreCollection();
    } else if (index == 3) {
      return QrScanner();
    } else if (index == 4) {
      return const ChatBot();
    }
  }

  void _ontapped(int idx) {
    setState(() {
      index = idx;
      print(idx);
    });
  }

  void _toggleBottomNavBar() {
    setState(() {
      isBottomNavBarVisible = !isBottomNavBarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: isBottomNavBarVisible
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedFontSize: 0,
                  backgroundColor: primaryColor,
                  currentIndex: index,
                  selectedItemColor: Colors.black,
                  onTap: _ontapped,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_rounded,
                        color: Colors.white,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.group,
                        color: Colors.white,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.store,
                        color: Colors.white,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.qrcode,
                        color: Colors.white,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.face_5_sharp,
                        color: Colors.white,
                      ),
                      label: '',
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: _screenChange(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          index == 0
              ? FloatingActionButton(
                  elevation: 20,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddRecords(),
                      ),
                    );
                  },
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          index == 4
              ? FloatingActionButton(
                  elevation: 20,
                  onPressed: _toggleBottomNavBar,
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    isBottomNavBarVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.white,
                  ),
                )
              : const SizedBox(
                  height: 00,
                ),
        ],
      ),
    );
  }
}
