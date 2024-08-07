import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantsnap/Screens/profile.dart';
import 'package:plantsnap/Screens/weather.dart';
import 'package:plantsnap/auth.dart';

class PlantCollection extends StatefulWidget {
  const PlantCollection({super.key});

  @override
  State<PlantCollection> createState() => _PlantCollectionState();
}

class _PlantCollectionState extends State<PlantCollection> {
  final Color primaryColor = const Color(0xff344e41);
  final Color secondaryColor = const Color(0xff588157);
  final Color TernaryColor = const Color(0xff3a5a40);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User user = Authantication().currentuser!;
  late String userId = user.uid;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: const Border(),
                            color: primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                      ),
                      const Positioned(
                        left: 10,
                        top: 9,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 38,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherWidget(),
                        ));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: const Border(),
                            color: primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                      ),
                      const Positioned(
                        left: 11,
                        top: 12,
                        child: Icon(
                          CupertinoIcons.cloud_sun_rain,
                          color: Colors.white,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
            child: Text(
              "Your Collection",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: _firestore
                  .collection('PlantCollection')
                  .doc(userId)
                  .collection('entries')
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Text('No data found');
                } else {
                  void deleteUserDocument(String docId) {
                    _firestore
                        .collection('PlantCollection')
                        .doc(userId)
                        .collection('entries')
                        .doc(docId)
                        .delete();
                  }

                  List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
                      snapshot.data!.docs;
                  return Container(
                    // color: Colors.black,
                    height: 630,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = docs[index].data();
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10.0, left: 16, right: 16),
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 16, right: 16),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Plant Name:${data['Plant Name']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Age:${data['Plant Age']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      TextButton(
                                          onPressed: () {
                                            String docId = docs[index].id;
                                            deleteUserDocument(docId);
                                          },
                                          child: const Text("Delete")),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
