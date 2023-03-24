import 'dart:io';

import 'package:breaker_pro/view/screens/allocating_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({super.key});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Details"),
        backgroundColor: Color.fromARGB(227, 226, 162, 51),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: build_vehicle_form("Registration Number"),
                        ),
                        SizedBox(
                          width: 175,
                          child: build_vehicle_form("Stock Reference"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child:
                              build_dropdownbuttonlist("Make", _dropDownList()),
                        ),
                        SizedBox(
                          width: 175,
                          child: build_vehicle_form("CC"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: build_dropdownbuttonlist(
                              "Model", _dropDownList2()),
                        ),
                        SizedBox(
                          width: 175,
                          child: build_vehicle_form("Type Model"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: build_dropdownbuttonlist(
                              "Fuel", _dropDownList3()),
                        ),
                        SizedBox(
                          width: 175,
                          child: build_dropdownbuttonlist(
                              "Body Style", _dropDownList4()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: build_vehicle_form("VIN"),
                        ),
                        SizedBox(
                          width: 175,
                          child: build_dropdownbuttonlist(
                              "Color", _dropDownList5()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: build_vehicle_form("Transmission"),
                        ),
                        SizedBox(
                          width: 175,
                          child: build_vehicle_form("Engine Code"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: build_dropdownbuttonlist(
                              "Manufacture Year", _dropDownList6()),
                        ),
                        SizedBox(
                          width: 175,
                          child: build_vehicle_form("On Site Date"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 165,
                          child: build_vehicle_form("Year Range"),
                        ),
                        Text(
                          "To",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 165,
                          child: build_vehicle_form("Stock Reference"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: build_vehicle_form("Mileage"),
                        ),
                        SizedBox(
                          width: 175,
                          child: build_vehicle_form("Cost Price"),
                        ),
                      ],
                    ),
                    build_vehicle_form("Vehicle Location"),
                    build_vehicle_form("Enter Comments"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Color.fromARGB(103, 158, 158, 158),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.camera_enhance_outlined,
                                ),
                                onPressed: () {
                                  pickImage(ImageSource.camera);
                                },
                              ),
                              SizedBox(width: 8),
                              Text("Capture"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.photo_outlined,
                                ),
                                onPressed: () {
                                  pickImage(ImageSource.gallery);
                                },
                              ),
                              SizedBox(width: 8),
                              Text("Gallery"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Color.fromARGB(227, 226, 162, 51),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            child: Text(
                              "Breaking for Spares",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: Text(
                              "Allocate Parts",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllocatePartsScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget build_vehicle_form(String text) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_dropdownbuttonlist(String text, Widget widget) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: widget,
            ),
          ),
        ],
      ),
    );
  }

  String? dropDownValue = 'AC COBRA';
  Widget _dropDownList() {
    return DropdownButton<String>(
      isExpanded: true,
      value:
          dropDownValue, // this place should not have a controller but a variable
      onChanged: (_value) {
        setState(
          () {
            dropDownValue = _value;
          },
        );
      },
      items: [
        "AC COBRA",
        "ALFA ROMEO",
        "ALLY",
        "ALY0207",
        "APRILIA",
        "AUDI",
        "AUSTIN",
        "B",
        "BEDFORD",
        "BENALU",
        "BENELLI",
        "BENTLEY"
      ]
          .map<DropdownMenuItem<String>>(
              (String _value) => DropdownMenuItem<String>(
                  value: _value, // add this property an pass the _value to it
                  child: Text(
                    _value,
                  )))
          .toList(),
    );
  }

  String? dropDownValue2 = 'AEORSTAR';
  Widget _dropDownList2() {
    return DropdownButton<String>(
      isExpanded: true,
      value:
          dropDownValue2, // this place should not have a controller but a variable
      onChanged: (_value) {
        setState(
          () {
            dropDownValue2 = _value;
          },
        );
      },
      items: [
        "AEORSTAR",
        "ANGLIA",
        "CAB FLAT PLATFORM",
        "CAPRI",
        "CAPRI 280",
        "CAPRI 3000 GXL",
        "CAPRI CABARET",
        "CAPRI GL",
        "CAPRI II GHIA AUTO",
        "CAPRI INJECTION",
        "CAPRI LASER",
        "CAPRI LASER AUTO"
      ]
          .map<DropdownMenuItem<String>>(
              (String _value) => DropdownMenuItem<String>(
                  value: _value, // add this property an pass the _value to it
                  child: Text(
                    _value,
                  )))
          .toList(),
    );
  }

  String? dropDownValue3 = '2020';
  Widget _dropDownList3() {
    return DropdownButton<String>(
      isExpanded: true,
      value:
          dropDownValue3, // this place should not have a controller but a variable
      onChanged: (_value) {
        setState(
          () {
            dropDownValue3 = _value;
          },
        );
      },
      items: [
        "2022",
        "2021",
        "2020",
        "2019",
        "2018",
        "2017",
        "2016",
        "2015",
        "2014",
        "2013",
        "2012",
        "2011",
        "2010",
        "2009"
      ]
          .map<DropdownMenuItem<String>>(
              (String _value) => DropdownMenuItem<String>(
                  value: _value, // add this property an pass the _value to it
                  child: Text(
                    _value,
                  )))
          .toList(),
    );
  }

  String? dropDownValue4 = 'DIESEL';
  Widget _dropDownList4() {
    return DropdownButton<String>(
      isExpanded: true,
      value:
          dropDownValue4, // this place should not have a controller but a variable
      onChanged: (_value) {
        setState(
          () {
            dropDownValue4 = _value;
          },
        );
      },
      items: ["DIESEL", "LPG", "PETROL"]
          .map<DropdownMenuItem<String>>(
              (String _value) => DropdownMenuItem<String>(
                  value: _value, // add this property an pass the _value to it
                  child: Text(
                    _value,
                  )))
          .toList(),
    );
  }

  String? dropDownValue5 = 'ALUMINIUM';
  Widget _dropDownList5() {
    return DropdownButton<String>(
      isExpanded: true,
      value:
          dropDownValue5, // this place should not have a controller but a variable
      onChanged: (_value) {
        setState(
          () {
            dropDownValue5 = _value;
          },
        );
      },
      items: [
        "ALUMINIUM",
        "ALUMINIUM/SILVER",
        "BEIGE",
        'BLACK',
        "BLUE",
        "BRONZE",
        "GOLD",
        "GREEN",
        "GREY",
        "MAROON",
        "NO VALUE",
        "ORANGE"
      ]
          .map<DropdownMenuItem<String>>(
              (String _value) => DropdownMenuItem<String>(
                  value: _value, // add this property an pass the _value to it
                  child: Text(
                    _value,
                  )))
          .toList(),
    );
  }

  String? dropDownValue6 = '2 DOOR CONVERTIBLE';
  Widget _dropDownList6() {
    return DropdownButton<String>(
      isExpanded: true,
      value:
          dropDownValue6, // this place should not have a controller but a variable
      onChanged: (_value) {
        setState(
          () {
            dropDownValue6 = _value;
          },
        );
      },
      items: [
        "2 DOOR CONVERTIBLE",
        "2 DOOR COUPE",
        "2 DOOR SALOON",
        "3 DOOR COUPE",
        "3 DOOR SALOON",
        "3 DOOR HATCHBACK",
        "4 DOOR SALOON",
        "5 DOOR ESTATE",
        "5 DOOR HATCHBACK",
        "5 DOOR SALOON",
        "MOTORBIKE",
        "VAN"
      ]
          .map<DropdownMenuItem<String>>(
              (String _value) => DropdownMenuItem<String>(
                  value: _value, // add this property an pass the _value to it
                  child: Text(
                    _value,
                  )))
          .toList(),
    );
  }

  // Pick the images Gallery
  File? image;
  final imagePicker = ImagePicker();
  pickImage(source) async {
    try {
      final image = await imagePicker.pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
