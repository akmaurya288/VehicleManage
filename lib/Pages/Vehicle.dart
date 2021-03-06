import 'package:flutter/material.dart';
import 'package:flutter_app/DataBase/VehicleModel.dart';
import 'package:flutter_app/Util/DbHelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app/Screen/AddVehicle.dart';

class Vehicle extends StatefulWidget {
  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  DatabaseHelper helper = DatabaseHelper();
  List<VehicleDB> model;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      model = List<VehicleDB>();
      updateListView();
    }
    return Scaffold(
      body: Container(
        color: Colors.red[50],
        child: ListView.builder(
          itemCount: count,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(child: Container(
              color: Colors.red[50],
              alignment: Alignment.center,
              child: Row(children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.red[700]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey,
                            ),
                            child: Image.asset("lib/Icon/IconUser.png",scale: 8.5,),
                          ),
                          Divider(height: 14,color: Colors.black,),
                          Text(model[index].plateno,style: TextStyle(
                            fontSize: 16.0,fontWeight: FontWeight.bold,
                          ),)
                          ],
                        )
                    )
                ),
                Expanded(
                    flex: 5
                    ,child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey),
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Phone No.:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Text(this.model[index].modelno,style: TextStyle(fontSize: 20),),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Vehicle ID:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Text(this.model[index].vehicleID.toString(),style: TextStyle(fontSize: 20),),
                          ],
                        )
                      ],
                    ),),
                ))
              ],
              ),
            ),
              onTap:()=>navigateToDetail(this.model[index],'Driver',false),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>navigateToDetail(VehicleDB('', '', '', ''),'Add Driver',true),
        backgroundColor: Colors.redAccent,
        tooltip: "Add new Todo",
        child: new Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
  void _delete(BuildContext context, VehicleDB vehicleDB) async {

    int result = await helper.deleteDriverNote(vehicleDB.vehicleID);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }
  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(duration: Duration(seconds: 1),content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
  void navigateToDetail(VehicleDB vehicleDB, String title, bool edit) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddVehicle(vehicleDB, title, edit);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {

    final Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<VehicleDB>> noteListFuture = helper.getVehicleList();
      noteListFuture.then((model) {
        setState(() {
          this.model = model;
          this.count = model.length;
        });
      });
    });
  }
}
