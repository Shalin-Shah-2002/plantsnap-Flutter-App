import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plantsnap/Screens/regscreen.dart';
import 'package:plantsnap/auth.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final Color primaryColor = const Color(0xff344e41);

  final Color secondaryColor = const Color(0xff588157);

  final Color TernaryColor = const Color(0xff3a5a40);
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();
  String? errorMessage = '';

  Future<void> loginDetails() async {
    try {
      await Authantication().signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
    } catch (e) {
      errorMessage = 'error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              primaryColor,
              secondaryColor,
              TernaryColor,
            ]),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 22),
            child: Text(
              'Hello\nSign in!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        hintText: 'Mail'),
                  ),
                  TextField(
                    controller: passwordcontroller,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        hintText: 'Password'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: const BoxDecoration(),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: const WidgetStatePropertyAll(15),
                            shadowColor: WidgetStatePropertyAll(primaryColor),
                            backgroundColor:
                                WidgetStatePropertyAll(TernaryColor)),
                        onPressed: () {
                          setState(() {
                            loginDetails();
                          });
                        },
                        child: const Text(
                          "Sign-In",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Don't have account?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegScreen(),
                                ));
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(

                                ///done login page
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
