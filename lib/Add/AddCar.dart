import 'package:flutter/material.dart';

class AddCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Backup"),
      ),
      body: Container(
        child: Image.asset('lib/Icon/IconCar.png'),
      ),
    );
  }
}
