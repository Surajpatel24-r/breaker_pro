import 'package:breaker_pro/model/checkboc_state.dart';
import 'package:breaker_pro/view/screens/customise_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AllocatePartsScreen extends StatefulWidget {
  const AllocatePartsScreen({super.key});

  @override
  State<AllocatePartsScreen> createState() => _AllocatePartsScreenState();
}

class _AllocatePartsScreenState extends State<AllocatePartsScreen> {
  bool value = false;
  final allAllocations = CheckBoxState(title: 'Select All');
  final allocations = [
    CheckBoxState(title: 'ABS PUMP/MODULATOR/CONTROL UNIT'),
    CheckBoxState(title: 'ABS SENSOR (FRONT DRIVER SIDE)'),
    CheckBoxState(title: 'ABS SENSOR (FRONT PASSENGER SIDE)'),
    CheckBoxState(title: 'ABS SENSOR (REAR DRIVER SIDE)'),
    CheckBoxState(title: 'ABS SENSOR (REAR PASSENGER SIDE)'),
    CheckBoxState(title: 'ACCELERATOR PEDAL'),
    CheckBoxState(title: 'ACCELERATOR PEDAL (ELECTONIC)'),
    CheckBoxState(title: 'AERIAL & BASE'),
    CheckBoxState(title: 'AERIAL & BASE (ELECTRIC)'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // floating: true,
            // pinned: true,
            // snap: false,
            // centerTitle: false,
            title: const Text('Allocation Parts'),
            backgroundColor: Color.fromARGB(227, 226, 162, 51),
            // leading: IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.arrow_back),
            // ),
            actions: [
              IconButton(
                onPressed: () {
                  _showMyDialog();
                },
                icon: Icon(
                  Icons.add_circle,
                  size: 33,
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 250,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              build_dropdownbuttonlist(
                                "Pre Defined",
                                _dropDownList1(),
                              ),
                              build_dropdownbuttonlist(
                                "Part Type",
                                _dropDownList(),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(175, 238, 167, 24),
                                ),
                                child: const Text('SAVE'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage("assets/images/menu.png"),
                    color: Colors.white,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ],
            bottom: AppBar(
              backgroundColor: Color.fromARGB(227, 226, 162, 51),
              title: Container(
                width: double.infinity,
                height: 48,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type Your keyword here',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate(
              [
                buildGroupCheckbox(allAllocations),
                ...allocations.map(buildSingleCheckbox).toList(),
                SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomisePartScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    color: Color.fromARGB(227, 226, 162, 51),
                    child: Center(
                      child: Text(
                        "Customise Parts",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSingleCheckbox(CheckBoxState checkbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Color.fromARGB(227, 226, 162, 51),
      value: checkbox.value,
      onChanged: (value) => setState(() {
        checkbox.value = value!;
        allAllocations.value = allocations.every((element) => element.value);
      }),
      title: Text(checkbox.title),
    );
  }

  Widget buildGroupCheckbox(CheckBoxState checkbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Color.fromARGB(227, 226, 162, 51),
      value: checkbox.value,
      onChanged: toggleGroupCheckbox,
      title: Text(checkbox.title),
    );
  }

  void toggleGroupCheckbox(bool? value) {
    if (value == null) return;
    setState(() {
      allAllocations.value = value;
      allocations.forEach((element) {
        element.value = value;
      });
    });
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

  // Part Type DropDown
  String? dropDownValue = 'SELECT';
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
        "SELECT",
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

  String? dropDownValue1 = 'SELECT';
  Widget _dropDownList1() {
    return DropdownButton<String>(
      isExpanded: true,
      value:
          dropDownValue1, // this place should not have a controller but a variable
      onChanged: (_value) {
        setState(
          () {
            dropDownValue1 = _value;
          },
        );
      },
      items: [
        "SELECT",
        "FACELIFT",
        "FRONT",
        "REAR",
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

  // Create a Dialog Box
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              height: 310,
              child: Column(
                children: [
                  Text(
                    "Add Part",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  build_dropdownbuttonlist(
                    "Part Type",
                    _dropDownList(),
                  ),
                  build_vehicle_form("Part Name"),
                  TextButton(
                    child: const Text(
                      'SAVE',
                      style: TextStyle(
                        color: Color.fromARGB(227, 226, 162, 51),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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
                label: Text("Part Name"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
