import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/checkboc_state.dart';

class CustomisePartScreen extends StatefulWidget {
  const CustomisePartScreen({super.key});

  @override
  State<CustomisePartScreen> createState() => _CustomisePartScreenState();
}

class _CustomisePartScreenState extends State<CustomisePartScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(227, 226, 162, 51),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Customise Parts"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "ALTERNATOR",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              build_dropdownbuttonlist("Part Condition", _dropDownList()),
              build_Alternator_form("Part Location"),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Quantity In Stock",
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 132,
                          child: build_Alternator_form("Sales Prize")),
                      SizedBox(
                          width: 132,
                          child: build_Alternator_form("Cost Prize")),
                      Text(
                        "Qty",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                          width: 60,
                          child: Center(child: build_Alternator_form("1"))),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 170),
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color.fromARGB(227, 226, 162, 51),
                      value: value,
                      onChanged: (value) => setState(() {
                        value = value!;
                      }),
                      title: Text("Set Defaults"),
                    ),
                  ),
                ],
              ),
              build_Alternator_form("Part Description"),
              build_Alternator_form("Manufacturer Part No"),
              build_Alternator_form("Part Comments"),
              build_dropdownbuttonlist("Postage Option", _dropDownList()),
              Padding(
                padding: const EdgeInsets.only(right: 230, top: 10),
                child: Text(
                  "Marketing",
                  style: TextStyle(fontSize: 22, color: Colors.grey),
                ),
              ),
              Column(
                children: [
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color.fromARGB(227, 226, 162, 51),
                    value: value,
                    onChanged: (value) => setState(() {
                      value = value!;
                    }),
                    title: Text("Ebay"),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color.fromARGB(227, 226, 162, 51),
                    value: value,
                    onChanged: (value) => setState(() {
                      value = value!;
                    }),
                    title: Row(
                      children: [
                        Text("Featured Web"),
                        SizedBox(width: 10),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    color: Color.fromARGB(103, 158, 158, 158),
                    height: 250,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              child: Image(
                                image: AssetImage("assets/images/logo.png"),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 120,
                              child: Image(
                                image: AssetImage("assets/images/logo.png"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      color: Color.fromARGB(227, 226, 162, 51),
                      child: Center(
                        child: Text(
                          "SAVE",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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

  Widget build_Alternator_form(String text) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   text,
            //   style: TextStyle(color: Colors.grey),
            // ),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(text),
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
            // child: Text(
            //   text,
            //   style: TextStyle(color: Colors.grey),
            // ),
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

  String? dropDownValue = 'BRAND NEW';
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
      items: ["BRAND NEW", "GOOD", "PERFECT", "POOR", "VERY GOOD", "WORN"]
          .map<DropdownMenuItem<String>>(
              (String _value) => DropdownMenuItem<String>(
                  value: _value, // add this property an pass the _value to it
                  child: Text(
                    _value,
                  )))
          .toList(),
    );
  }

  // CheckBox
  Widget buildSingleCheckbox(CheckBoxState checkbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Color.fromARGB(227, 226, 162, 51),
      value: checkbox.value,
      onChanged: (value) => setState(() {
        checkbox.value = value!;
      }),
      title: Text(checkbox.title),
    );
  }
}
