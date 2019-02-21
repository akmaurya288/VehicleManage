import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Scaffold(

        appBar: AppBar(
          title: Text("qwerty"),
          bottom: TabBar(
              tabs: [
                Tab(icon: Image.asset('lib/Icon/IconHome.png', scale: 45),
                  text: 'Home',),
                Tab(icon: Image.asset('lib/Icon/IconInsurance.png', scale: 45),
                  text: 'Insurance',),
                Tab(icon: Image.asset('lib/Icon/IconUser.png', scale: 45),
                  text: 'Driver',),
                Tab(icon: Image.asset('lib/Icon/IconProfit.png', scale: 45),
                  text: 'Profit',),
              ]),
        ),

        drawer: Drawer(
    child: ListView(
    children: <Widget>[
    ListTile(
    title: Text("asdfg"),
      trailing: Icon(Icons.ac_unit),
      onTap: () => Navigator.of(context).pop(),
    )
    ],
    ),
    ),
    body: Center(
    child: Text("qwerty"),
    ),
    )
    );
  }
}
