import 'package:firebase_auth/firebase_auth.dart';

import 'package:plantsnap/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final User? user = Authantication().currentuser;

  Future<void> signOut() async {
    await Authantication().signOut();
  }

  Widget _title() {
    return const Text('Firebase authantication');
  }

  Widget _userId() {
    return Text(user?.email ?? "User Email");
  }

  Widget signOutButton() {
    return ElevatedButton(onPressed: signOut, child: const Text('data'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_userId(), signOutButton()],
        ),
      ),
    );
  }
}
