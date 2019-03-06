import 'package:flutter/material.dart';
import 'package:flutter_app/DataBase/new.dart';
import 'package:flutter_app/DataBase/dr.dart';
import 'package:intl/intl.dart';

DatabaseHelper helper = DatabaseHelper();

final List<String> choices = const <String> [
  'Save & Back',
  'Delete Todo',
  'Back to List'
];

const mnuSave = 'Save & Back';
const mnuDelete = 'Delete Todo';
const mnuBack = 'Back to List';

class AddDriver extends StatefulWidget {
  final DriverDBAdd todo;
  AddDriver(this.todo);

  @override
  State<StatefulWidget> createState() => AddDriverState(todo);

}
class AddDriverState extends State {
  DriverDBAdd todo;
  AddDriverState(this.todo);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.DriverName;
    descriptionController.text = todo.VehicalID;
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(todo.DriverName),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: select,
              itemBuilder: (BuildContext context) {
                return choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.only(top:35.0, left: 10.0, right: 10.0),
            child: ListView(children: <Widget>[Column(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value)=> this.updateName(),
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                    child: TextField(
                      controller: descriptionController,
                      style: textStyle,
                      onChanged: (value) => this.updateVehicleID(),
                      decoration: InputDecoration(
                          labelText: "VehileId",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                      ),
                    )),
              ],
            )],)
        )
    );
  }

  void select (String value) async {
    int result;
    switch (value) {
      case mnuSave:
        save();
        break;
      case mnuDelete:
        Navigator.pop(context, true);
        if (todo.Mobno == null) {
          return;
        }
        result = await helper.deleteNote(todo.Mobno);
        if (result != 0) {
          AlertDialog alertDialog = AlertDialog(
            title: Text("Delete Todo"),
            content: Text("The Todo has been deleted"),
          );
          showDialog(
              context: context,
              builder: (_) => alertDialog);

        }
        break;
      case mnuBack:
        Navigator.pop(context, true);
        break;
      default:
    }
  }

  void save() {
    todo.date = new DateFormat.yMd().format(DateTime.now());
    if (todo.Mobno != null) {
      helper.updateNote(todo);
    }
    else {
      helper.insertNote(todo);
    }
    Navigator.pop(context, true);
  }

  void updateName(){
    todo.DriverName = titleController.text;
  }

  void updateVehicleID() {
    todo.Adders = descriptionController.text;
  }

}

