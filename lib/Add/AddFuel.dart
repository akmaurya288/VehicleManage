import 'package:flutter/material.dart';

class AddFuel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Backup"),
      ),
      body: Container(
        child: Image.asset('lib/Icon/IconFire.png'),
      ),
    );
  }
}
