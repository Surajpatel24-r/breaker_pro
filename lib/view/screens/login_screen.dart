import 'dart:math';

import 'package:breaker_pro/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(238, 255, 255, 255),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
              customCircleLogo(),
              SizedBox(height: 15),
              customTextFields(
                "Client Id",
                Icon(Icons.fingerprint),
              ),
              customTextFields(
                "User Name",
                Icon(Icons.person),
              ),
              customTextFields(
                "Password",
                Icon(Icons.lock_open),
              ),
              SizedBox(
                height: 18,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(175, 238, 167, 24),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  child: Text(
                    "LOG IN",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  _showMyDialog();
                },
                child: Center(
                  child: Text(
                    "Forgot Your Password?",
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              SizedBox(height: 17),
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
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text("Updated on 11 February 2023"),
                  ],
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

  Widget customTextFields(String text, Icon icon) {
    return Padding(
      padding:
          EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: 0.8),
          ),
          hintText: text,
          prefixIcon: icon,
        ),
      ),
    );
  }

  Widget customCircleLogo() {
    return Center(
      child: Container(
        height: 150,
        width: 380,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 10))
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Create a Dialog Box
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 70, 68, 68),
          title: Row(
            children: [
              Icon(
                Icons.error,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(width: 9),
              Text(
                "Forgot Password",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'Please contact BreakerPRO administrator to reset your password.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
