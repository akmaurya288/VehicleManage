import 'package:flutter/material.dart';
import 'Pages/Home.dart';
import 'Pages/Driver.dart';
import 'Pages/Profit.dart';
import 'Pages/Insurance.dart';
import 'Screen/backup.dart';
import 'Screen/settings.dart';
import 'Screen/AddCar.dart';
import 'Screen/AddDriver.dart';
import 'Pages/Car.dart';
import 'package:flutter_app/DataBase/DriverModel.dart';
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
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 5, child: Scaffold(
      body: NestedScrollView(headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
        return <Widget>[
          SliverAppBar(
        pinned: true,
    floating: true,
    forceElevated: innerBoxIsScrolled,
    title: Text("Driver Test"),
    elevation: 4.0,
    backgroundColor: Color(0xffb71c1c),
    bottom: TabBar(
    indicatorColor: Colors.white,
    tabs: [
    Tab(icon: Image.asset('lib/Icon/IconHome.png', scale: 45),
    text: 'Home',),
    Tab(icon: Image.asset('lib/Icon/IconCar.png', scale: 45),
      text: 'Vehicle',),
    Tab(icon: Image.asset('lib/Icon/IconUser.png', scale: 45),
    text: 'Driver',),
    Tab(icon: Image.asset('lib/Icon/IconInsurance.png', scale: 45),
      text: 'Insurance',),
    Tab(icon: Image.asset('lib/Icon/IconProfit.png', scale: 45),
    text: 'Profit',),
    ]),
    )
        ];
    }, body: TabBarView(
        children: [Home(), Car(), Driver(),TodoList(), Profit()],
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
                  'Driver',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(null),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AddDriver(DriverDB('', 0, '', '', '', '', 0, ''),'Add Driver')));
                },
              ),
              ListTile(
                title: Text(
                  'Car',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(null),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddCar()));
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