import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/DataBase/DriverModel.dart';
import 'package:flutter_app/Util/DbHelper.dart';
import 'package:flutter_app/Pages/Driver.dart';

class AddDriver extends StatefulWidget {
  final String appBarTitle;
  final DriverDB driverDB;
  AddDriver(this.driverDB,this.appBarTitle);

  @override
  _AddDriverState createState() => _AddDriverState(this.driverDB, this.appBarTitle);
}

class _AddDriverState extends State<AddDriver> {

  DatabaseHelper helper= DatabaseHelper();

  String appBarTitle;
  DriverDB driverDB;
  _AddDriverState(this.driverDB, this.appBarTitle);

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController medicalController = TextEditingController();
  TextEditingController policeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: null,

        child:Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),

          ),
          body: Padding(padding: EdgeInsets.only(top:15.0, left:10.0, right:10.0),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextField(
                      controller: nameController,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateTitle();
                      },
                      decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),

                  // Fourth Element
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'Save',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                debugPrint("Save button clicked");
                                _save();
                              });
                            },
                          ),
                        ),

                        Container(width: 5.0,),

                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'Delete',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                debugPrint("Delete button clicked");
                                _delete();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
          ),
          ),
        )
    );
  }

  void updateTitle(){
    driverDB.driverName = nameController.text;
    driverDB.mobno = mobileController.text as int;
    driverDB.adders = addressController.text;
    driverDB.medical = medicalController.text;
    driverDB.policeVeri = policeController.text;
  }
  // Save data to database
  void _save() async {
    moveToLastScreen();
    driverDB.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    debugPrint(result.toString());
    if (driverDB.driverID != null) {  // Case 1: Update operation
      result = await helper.updateNote(driverDB);
    } else { // Case 2: Insert Operation
      result = await helper.insertNote(driverDB);
    }

    if (result != 0) {  // Success
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {  // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }

  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }

  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (driverDB.driverID == null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteNote(driverDB.driverID);
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
