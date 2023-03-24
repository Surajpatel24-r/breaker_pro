import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ManagePartScreen extends StatefulWidget {
  const ManagePartScreen({super.key});

  @override
  State<ManagePartScreen> createState() => _ManagePartScreenState();
}

class _ManagePartScreenState extends State<ManagePartScreen> {
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
        title: Text("Manage Part"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Container(
                    width: 170,
                    child: Image(
                      image: AssetImage("assets/images/breakerPRO5.png"),
                    ),
                  ),
                ),
              ),
              Text(
                "Manage Parts",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  color: Colors.white,
                  child: const Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '1471-021220-211937-8',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 140,
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            "Reset",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 180,
                        height: 50,
                        color: Color.fromARGB(227, 226, 162, 51),
                        child: Center(
                          child: Text(
                            "Find",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    color: Color.fromARGB(227, 226, 162, 51),
                    child: Center(
                      child: Text(
                        "Scan Part",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    color: Color.fromARGB(227, 226, 162, 51),
                    child: Center(
                      child: Text(
                        "Advanced Search",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
