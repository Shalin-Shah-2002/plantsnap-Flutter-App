import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:plantsnap/Screens/loginscreen.dart';
import 'package:plantsnap/auth.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key }) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final Color primaryColor = const Color(0xff344e41);

  final Color secondaryColor = const Color(0xff588157);

  final Color ternaryColor = const Color(0xff3a5a40);

  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  String? errorMessage = '';

  Future<void> signupWithDetails() async {
    try {
      await Authantication().createUserWithEmailAndPassword(
          name: namecontroller.text,
          email: emailcontroller.text,
          password: passwordcontroller.text);
    } catch (e) {
      setState(() {
        errorMessage = 'error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      //thanks for watching
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              primaryColor,
              secondaryColor,
              ternaryColor,
            ]),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 22),
            child: Text(
              'Create Your\nAccount',
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
                    controller: namecontroller,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        hintText: 'Full Name'),
                  ),
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
                  const TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        hintText: 'Confirm Password'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
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
                                WidgetStatePropertyAll(ternaryColor)),
                        onPressed: () {
                          setState(() {
                            signupWithDetails();
                          });
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const loginScreen(),
                              )),
                          child: const Text(
                            "Login",
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
