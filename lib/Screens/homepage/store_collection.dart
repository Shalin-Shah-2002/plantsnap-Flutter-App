import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantsnap/Screens/profile.dart';
import 'package:plantsnap/Screens/weather.dart';
import 'package:plantsnap/amazon_api.dart';

import 'package:url_launcher/url_launcher.dart';

class StoreCollection extends StatefulWidget {
  const StoreCollection({super.key});

  @override
  State<StoreCollection> createState() => _StoreCollectionState();
}

class _StoreCollectionState extends State<StoreCollection> {
  final Color primaryColor = const Color(0xff344e41);
  final Color secondaryColor = const Color(0xff588157);
  final Color TernaryColor = const Color(0xff3a5a40);
  final AmazonApiClient amazonApiClient = AmazonApiClient();

  final Future<Map<String, dynamic>> _amazondata =
      AmazonApiClient().searchProducts("Plant pots");

  @override
  Widget build(BuildContext context) {
    return Column(
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

              // const SizedBox(width: 20,),
              const Text(
                " Store",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        Container(
          height: 692,
          width: double.infinity,
          child: FutureBuilder<Map<String, dynamic>>(
              future: _amazondata,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('No data found');
                } else {
                  final amazonData = snapshot.data!;
                  // print('Weather data: $amazonData');
                  final title = amazonData['data'];
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                    itemCount: 45,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.scaleDown,
                                        image: NetworkImage(
                                            "${title['products'][index]['product_photo']}")),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                height: 350,
                                width: 350,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 0,
                                          ),
                                          Flexible(
                                            child: Center(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                height: 50,
                                                width: 350,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: Color.fromARGB(
                                                        125, 0, 0, 0)),
                                                child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  "${title['products'][index]['product_title']}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 220,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10))),
                                            height: 40,
                                            width: 80,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text(
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    '\₹ ${title['products'][index]['product_price']}'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          height: 40,
                                          width: 100,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  elevation:
                                                      const WidgetStatePropertyAll(
                                                          10),
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          primaryColor)),
                                              onPressed: () {
                                                String link =
                                                    '${title['products'][index]['product_url']}';

                                                launchUrl(Uri.parse(link),
                                                    mode: LaunchMode
                                                        .externalApplication);
                                              },
                                              child: const Text(
                                                "More",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
        )
      ],
    );
  }
}
