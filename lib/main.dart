import 'package:emergency_text/button_screen.dart';
import 'package:flutter/material.dart';
import 'prefs.dart';

Prefs prefs = Prefs();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.getAppHistory();
  bool state = prefs.isNew ?? false;
  runApp(
    MaterialApp(
      home: state == true ? ButtonScreen() : MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String phoneNo;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            prefs.setAppHistory();
            prefs.setMob(phoneNo);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ButtonScreen()),
            );
          },
          backgroundColor: Colors.black,
          child: Icon(Icons.arrow_forward),
        ),
        backgroundColor: Color(0xFF9ad3bc),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 200.0,
              ),
              TextField(
                cursorColor: Colors.black,
                autofocus: true,
                onChanged: (value) {
                  phoneNo = value;
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Enter your emergency contact",
                  hintStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
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
