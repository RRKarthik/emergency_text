import 'package:flutter/material.dart';
class ButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9ad3bc),
      body: Column(
        children: [
          FlatButton(
            color: Colors.black,
            child: Text('Help',style: TextStyle(color: Colors.white),),
            onPressed: (){
              
            },
          ),
        ],
      ),
    );
  }
}
