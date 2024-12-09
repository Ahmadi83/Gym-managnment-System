import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _MyAppState();
}

class _MyAppState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Settings',style: TextStyle(fontSize: 30),)
        ],
      )
    );
  }
}
