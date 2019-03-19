import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_app/DataBase/DriverModel.dart';
import 'package:flutter_app/Util/DbHelper.dart';

class AddVehicle extends StatefulWidget {
  final String appBarTitle;
  final DriverDB driverDB;
  final bool edit;
  AddVehicle(this.driverDB,this.appBarTitle,this.edit);

  @override
  _AddVehicleState createState() => _AddVehicleState(this.driverDB, this.appBarTitle, this.edit);
}

class _AddVehicleState extends State<AddVehicle> {

  DatabaseHelper helper= DatabaseHelper();
  String appBarTitle;
  DriverDB driverDB;
  bool edit=false;

  _AddVehicleState(this.driverDB, this.appBarTitle, this.edit);

  TextEditingController plateController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController distanceCoveredController = TextEditingController();
  TextEditingController averageController = TextEditingController();
  TextEditingController fuelCostController = TextEditingController();
  TextEditingController insuranceCostController = TextEditingController();
  TextEditingController insuranceDueDateController = TextEditingController();
  TextEditingController insuranceCompanyController = TextEditingController();
  TextEditingController serviceTypeController = TextEditingController();
  TextEditingController serviceDateController = TextEditingController();
  TextEditingController serviceCostController = TextEditingController();
  TextEditingController serviceWhatController = TextEditingController();
  TextEditingController serviceWhereController = TextEditingController();
  TextEditingController fitnesslastController = TextEditingController();
  TextEditingController fitnessNextDateController = TextEditingController();
  TextEditingController fitnessCostController = TextEditingController();
  TextEditingController pollutionLastController = TextEditingController();
  TextEditingController pollutionNextDateController = TextEditingController();
  TextEditingController pollutionCostController = TextEditingController();
  TextEditingController taxTypeController = TextEditingController();
  TextEditingController taxCostController = TextEditingController();
  TextEditingController taxDateController = TextEditingController();
  TextEditingController taxNextDateController = TextEditingController();
  TextEditingController taxWhyController = TextEditingController();
  TextEditingController lastFillDateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    checkEmpty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: null,

        child:Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.delete_forever),
                  tooltip: 'Delete',
                  onPressed: _delete),
              IconButton(
                icon: Icon(Icons.edit),
                tooltip: 'Edit',
                onPressed:()=> setState(() {
                  edit=true;
                }),
              ),
              IconButton(
                  icon: Icon(Icons.save),
                  tooltip: 'Save',
                  onPressed:_save
              )
            ],
          ),
          body: Padding(padding: EdgeInsets.only(top:15.0, left:10.0, right:10.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    enabled: edit,
                    controller: typeController,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateTitle();
                    },
                    decoration: InputDecoration(
                        labelText: 'Vehicle Type',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    enabled: edit,
                    controller: plateController,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field' + value);
                      setState(() {
                        updateTitle();
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'Vehicle Model',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
  void checkEmpty(){
    if(driverDB.driverID!=null){
      plateController.text = driverDB.plateno;
      typeController.text = driverDB.adders;

    }
  }
  void updateTitle(){
    driverDB.driverName = plateController.text;
    driverDB.adders = typeController.text;

  }
  // Save data to database
  void _save() async {
    moveToLastScreen();
    driverDB.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (driverDB.vehicleID != null) {  // Case 1: Update operation
      debugPrint(driverDB.vehicleID.toString());
      result = await helper.updatevehicleNote(driverDB);
    } else { // Case 2: Insert Operation
      result = await helper.insertvehicleNote(driverDB);
    }

    if (result != 0) {  // Success
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {  // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }

    debugPrint(result.toString());

  }

  void moveToLastScreen() {
    Navigator.pop(context,true);
  }

  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (driverDB.vehicleID== null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deletevehicalNote(driverDB.vehicleID);
    if (result != 0) {
      _showAlertDialog('Status', 'Note Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Note');
    }
  }

  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }
}
