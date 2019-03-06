import 'package:flutter/material.dart';

class AddIncome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Backup"),
      ),
      body: Container(
        child: Icon(Icons.attach_money),
      ),
    );
  }
}
