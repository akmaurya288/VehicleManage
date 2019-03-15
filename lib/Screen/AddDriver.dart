import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter_app/DataBase/DriverModel.dart';
import 'package:flutter_app/Util/DbHelper.dart';
import 'package:image_picker/image_picker.dart';

class AddDriver extends StatefulWidget {
  final String appBarTitle;
  final DriverDB driverDB;
  final bool edit;
  AddDriver(this.driverDB,this.appBarTitle,this.edit);

  @override
  _AddDriverState createState() => _AddDriverState(this.driverDB, this.appBarTitle, this.edit);
}

class _AddDriverState extends State<AddDriver> {

  DatabaseHelper helper= DatabaseHelper();
  File _image;
  String appBarTitle;
  DriverDB driverDB;
  bool edit=false;
  _AddDriverState(this.driverDB, this.appBarTitle, this.edit);
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController leaveController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController medicalController = TextEditingController();
  TextEditingController policeController = TextEditingController();

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
                      controller: nameController,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateTitle();
                      },
                      decoration: InputDecoration(
                          labelText: 'Driver Name',
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
                      controller: mobileController,
                      keyboardType: TextInputType.numberWithOptions(decimal: false),
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateTitle();
                      },
                      decoration: InputDecoration(
                          labelText: 'Contact Mobile Number',
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
                      controller: addressController,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateTitle();
                      },
                      decoration: InputDecoration(
                          labelText: 'Address',
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
                      controller: expiryController,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateTitle();
                      },
                      decoration: InputDecoration(
                          labelText: 'Licence Expiry',
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
                      controller: experienceController,
                      keyboardType: TextInputType.numberWithOptions(decimal: false),
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateTitle();
                      },
                      decoration: InputDecoration(
                          labelText: 'Experience',
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
                      controller: leaveController,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateTitle();
                      },
                      decoration: InputDecoration(
                          labelText: 'Leave',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Center(
                        child: _image==null ? Text("Select Image"):Image.file(_image),
                      ),
                      Row(
                        children: <Widget>[
                          RaisedButton(
                          child: Icon(Icons.image),
                          onPressed: getImageGallery
                          ),
                          RaisedButton(
                            child: Icon(Icons.camera),
                            onPressed: getImageCamera,
                          )

                        ],
                      )
                    ],
                  )
                ],
          ),
          ),
        )
    );
  }
  Future getImageGallery()async{
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=imageFile;
    });
  }
  Future getImageCamera()async{
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image=imageFile;
    });
  }

  void updateTitle(){
    driverDB.driverName = nameController.text;
    driverDB.mobno = mobileController.text as int;
    driverDB.adders = addressController.text;
    driverDB.exp = experienceController as int;
    driverDB.expiry = expiryController.text;
    driverDB.medical = medicalController.text;
    driverDB.leave = leaveController.text;
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
    Navigator.pop(context,true);
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
