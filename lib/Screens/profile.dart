import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:plantsnap/Screens/loginscreen.dart';
import 'package:plantsnap/Screens/regscreen.dart';
import 'package:plantsnap/auth.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Color primaryColor = const Color(0xff344e41);

  final Color secondaryColor = const Color(0xff588157);

  final Color TernaryColor = const Color(0xff3a5a40);

  final User? user = Authantication().currentuser;

  Future<void> signOut() async {
    await Authantication().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor,
                    width: 3,
                  ),
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: Text(
                  'Username',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor,
                    width: 3,
                  ),
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: Text(
                  user?.email ?? "Email",
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
                height: 45,
                width: 175,
                decoration: const BoxDecoration(

                    // color: Colors.black
                    ),
                child: ElevatedButton(
                  onPressed: () {
                    signOut();
                    Authantication();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => loginScreen(),
                        ));
                  },
                  child: const Text(
                    'Log out',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(secondaryColor)),
                ))
          ],
        ),
      ),
    );
  }
}
