import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:plantsnap/auth.dart';

class AddRecords extends StatefulWidget {
  AddRecords({super.key});

  @override
  State<AddRecords> createState() => _AddRecordsState();
}

class _AddRecordsState extends State<AddRecords> {
  final Color primaryColor = const Color(0xff344e41);
  final Color secondaryColor = const Color(0xff588157);
  final Color TernaryColor = const Color(0xff3a5a40);
  TextEditingController _plantName = TextEditingController();
  TextEditingController plantAge = TextEditingController();
  TextEditingController plantSource = TextEditingController();
  TextEditingController plantCategory = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User user;
  late String userId;





  void initState() {
    super.initState();
    user = Authantication().currentuser!;
    userId = user.uid;
  }

  CreatedData() async {
    String name = _plantName.text;
    int? age = int.tryParse(plantAge.text);
    String source = plantSource.text;
    String category = plantCategory.text;

    Map<String, dynamic> plantsCollection = {
      "Plant Name": name,
      "Plant Age": age,
      "Source": source,
      "Category": category,
      'timestamp': FieldValue.serverTimestamp(),
    };
    print("Created");

    DocumentReference documentReference =
        _firestore.collection('PlantCollection').doc(userId);
    try {
      await documentReference.collection('entries').add(plantsCollection);
      print("Document has been set for: ${documentReference.id}");
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Records"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: secondaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _plantName,
                  decoration: const InputDecoration(
                    hintText: 'Plant Name',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              )),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: secondaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: plantAge,
                decoration: const InputDecoration(
                    hintText: 'Plant Age',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: secondaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: plantSource,
                decoration: const InputDecoration(
                    hintText: 'Source',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: secondaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: plantCategory,
                decoration: const InputDecoration(
                    hintText: 'Category',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Spacer(),
              TextButton(
                  onPressed: () {
                    CreatedData();
                  },
                  child: const Text("Add")),
              const SizedBox(
                width: 40,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
