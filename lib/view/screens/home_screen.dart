import 'dart:math';

import 'package:breaker_pro/view/screens/manage_part.dart';
import 'package:breaker_pro/view/screens/vehicle_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(227, 226, 162, 51),
        title: Text("BreakerPRO"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.messenger_outline_sharp),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              _build_homepage_details(
                  "Add Breaker",
                  Image(
                    image: AssetImage("assets/images/breakerPRO1.png"),
                  ),
                  "Add a new Breaker, or customised to an existing"),
              SizedBox(height: 20),
              _build_homepage_details(
                  "Add Part",
                  Image(
                    image: AssetImage("assets/images/breakerPRO2.png"),
                  ),
                  "Easily add the part according to your specific needs"),
              SizedBox(height: 20),
              _build_homepage_details(
                  "Scan Location",
                  Image(
                    image: AssetImage("assets/images/breakerPRO3.png"),
                  ),
                  "Allocate parts into a shelf location by scanning or searing the parts"),
              SizedBox(height: 20),
              _build_homepage_details(
                  "Scan Imaging",
                  Image(
                    image: AssetImage("assets/images/breakerPRO4.png"),
                  ),
                  "Quick way to scan and take images"),
              SizedBox(height: 20),
              _build_homepage_details(
                  "Manage Parts",
                  Image(
                    image: AssetImage("assets/images/breakerPRO5.png"),
                  ),
                  "Search and manage existing stock"),
              SizedBox(height: 20),
              _build_homepage_details(
                  "Work Orders",
                  Image(
                    image: AssetImage("assets/images/breakerPRO6.png"),
                  ),
                  "Process and manage picking, packing and dispatch orders"),
              SizedBox(height: 35),
              build_chat_whatsapp_button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _build_homepage_details(
      String text_name, Image image, String text_desc) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (text_name == "Add Breaker") {
            _showMyDialog1();
          } else if (text_name == "Scan Location") {
            _showMyDialog2();
          } else if (text_name == "Manage Parts") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ManagePartScreen(),
              ),
            );
          }
        },
        child: Container(
          height: 160,
          width: 322,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 2.0, spreadRadius: 2.0, color: Colors.grey[400]!),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 199,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text_name,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 35),
                      Text(
                        text_desc,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 10.0),
                    ],
                  ),
                ),
              ),
              Container(
                height: 99,
                child: ClipRRect(
                  child: image,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // launch the Whatsapp
  void launchWhatsapp({@required number}) async {
    String url = "whatsapp://send?phone=$number";
    await canLaunch(url) ? launch(url) : print("Can't open whatsapp");
  }

  // Launch Support Url
  void launchLiveChatURL() async {
    const url = 'https://tawk.to/BreakerPRO';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build_chat_whatsapp_button() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                launchLiveChatURL();
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 228, 149, 22),
              ),
              child: SizedBox(
                height: 55,
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.message,
                      size: 35,
                    ),
                    Text(
                      "Live Chat",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                launchWhatsapp(number: "+918602113326");
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: SizedBox(
                height: 55,
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.whatsapp,
                      size: 35,
                    ),
                    SizedBox(
                      height: sqrt1_2,
                    ),
                    Text(
                      "Whatsapp Chat",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        Center(
          child: Column(
            children: [
              Text("2021 All Right Reserved By Lyons Systems Ltd."),
              SizedBox(height: 9),
              Text(
                "version 135(4.1.29)",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  // Create a Dialog Box
  Future<void> _showMyDialog1() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              height: 394,
              child: Column(
                children: [
                  Container(
                    height: 140,
                    child: Image(
                      image: AssetImage("assets/images/breakerPRO1.png"),
                    ),
                  ),
                  Text(
                    "Add a Breaker",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Registration Number',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Stock Reference Number',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextButton(
                    child: const Text(
                      'MANUAL ENTRY',
                      style: TextStyle(
                        color: Color.fromARGB(227, 226, 162, 51),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VehicleDetailsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Create a Dialog Box
  Future<void> _showMyDialog2() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              height: 390,
              child: Column(
                children: [
                  Container(
                    height: 140,
                    child: Image(
                      image: AssetImage("assets/images/breakerPRO3.png"),
                    ),
                  ),
                  Text(
                    "Scan Location",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: 140,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '1471-',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 75,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(175, 238, 167, 24),
                          ),
                          child: Container(
                            height: 20,
                            child: Center(
                              child: Text(
                                "Find",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(175, 238, 167, 24),
                    ),
                    child: Container(
                      height: 45,
                      child: Center(
                        child: Text(
                          "Scan Part",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(175, 238, 167, 24),
                    ),
                    child: Container(
                      height: 45,
                      child: Center(
                        child: Text(
                          "Quick Scan",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
