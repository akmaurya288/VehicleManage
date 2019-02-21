import 'package:flutter/material.dart';
import 'Pages/Home.dart';
import 'Pages/Driver.dart';
import 'Pages/Profit.dart';
import 'Pages/Insurance.dart';
import 'Screen/backup.dart';
import 'Screen/settings.dart';
import 'dart:async';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor:  Color(0xffb71c1c),),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
//
//class Firstscreen extends StatefulWidget {
//  @override
//  _FirstscreenState createState() => _FirstscreenState(100);
//
//}
//
//class _FirstscreenState extends State<Firstscreen> {
//  double siz;
//  _FirstscreenState(this.siz);
//  @override
//  void initState() {
//    Timer(Duration(seconds: 5),()=>_FirstscreenState(200));
//    // TODO: implement initState
//    super.initState();
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Stack(
//        fit: StackFit.expand,
//          children: <Widget>[
//            Container(
//              decoration: BoxDecoration(color: Color(0xffb71c1c)),
//            ),
//            Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Expanded(flex: 2 ,child: Container(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      CircleAvatar(
//                        backgroundColor: Colors.white,
//                        radius: siz,
//                        child: Image.asset('lib/Icon/IconCarR.png'),
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0)),
//                      Text("DriverTest",style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),)
//                    ],
//                  ),
//                )
//                ),
//                Expanded(flex:1,child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    CircularProgressIndicator(),
//
//                  ],
//                ))
//              ],
//            )
//          ],
//      ),
//    );
//  }
//}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Scaffold(
      body: NestedScrollView(headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
        return <Widget>[
          SliverAppBar(
        pinned: true,
    floating: true,
    forceElevated: innerBoxIsScrolled,
    title: Text("Hare Krishna"),
    elevation: 4.0,
    backgroundColor: Color(0xffb71c1c),
    bottom: TabBar(
    indicatorColor: Colors.white,
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
    )
        ];
    }, body: TabBarView(
        children: [Home(), Insurance(), Driver(), Profit()],
      ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Color(0xffb71c1c)
              ),
              accountName: Text("DriverAssistant"),
              accountEmail: Text("driver@test.com"),
              currentAccountPicture: Image.asset('lib/Icon/IconHome.png'),
            ),
            ExpansionTile(title: Text("Add",style: TextStyle(fontSize: 18.0),),leading: Icon(Icons.add),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Income',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(null),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Fuel',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(null),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Driver',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(null),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Car',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(null),
                onTap: (){
                  Navigator.of(context).pop(context);
                },
              ),
            ],
            ),

            Divider(),

            ListTile(
              title: Text(
                "Backup",
                style: TextStyle(fontSize: 18.0),
              ),
              trailing: Icon(Icons.backup),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Backup()));
              },
            ),
            ListTile(
              title: Text(
                'Setting',
                style: TextStyle(fontSize: 18.0),
              ),
              trailing: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context)=>Settings()));
              },
            ),
          ],
        ),
      ),
    )
    );
  }
}
