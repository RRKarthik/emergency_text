import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'locator.dart';
import 'prefs.dart';

Prefs prefs = Prefs();
Locator locator = Locator();
class ButtonScreen extends StatefulWidget {
  @override
  _ButtonScreenState createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  void initState() {
      super.initState();
      locator.getLocation();
      prefs.getMob();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9ad3bc),
      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            FlatButton(
              color: Colors.black,
              child: Padding(
                padding:  EdgeInsets.all(50.0),
                child: Text('Help',style: TextStyle(color: Colors.white,fontSize: 40.0),),
              ),
              onPressed: (){
                   locator.sender(prefs.mobile, locator.longitude, locator.latitude) ;
              },
            ),
          ],
        ),
      ),
    );
  }
}
