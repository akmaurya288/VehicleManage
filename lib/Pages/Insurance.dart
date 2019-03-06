import 'package:flutter/material.dart';
import 'package:flutter_app/DataBase/new.dart';
import 'package:flutter_app/DataBase/dr.dart';
import 'package:flutter_app/Add/AddDriver.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState();

}

class TodoListState extends State {
  DatabaseHelper helper = DatabaseHelper();
  List<DriverDBAdd> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = List<DriverDBAdd>();
      getData();
    }
    return Scaffold(
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          navigateToDetail(DriverDBAdd('', 0, '', 0, '', '', '', 0, '',''));
        }
        ,
        tooltip: "Add new Todo",
        child: new Icon(Icons.add),
      ),
    );
  }
  ListView todoListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child:Icon(Icons.person,color: Colors.black,),
            ),
            title: Text(this.todos[position].DriverName),
            subtitle: Text(this.todos[position].VehicalID),
            onTap: () {
              debugPrint("Tapped on " + this.todos[position].DriverName);
              navigateToDetail(this.todos[position]);
            },
          ),
        );
      },
    );
  }
  void getData() {
    final dbFuture = helper.initializeDatabase();
    dbFuture.then((result) {
      final todosFuture = helper.getNoteList();
      todosFuture.then((result){
        List<DriverDBAdd> todoList = List<DriverDBAdd>();
        count = result.length;
        for (int i=0; i<count; i++) {
          todoList.add(DriverDBAdd.fromMapObject(result[i]));
          debugPrint(todoList[i].DriverName);
        }
        setState(() {
          todos = todoList;
          count = count;
        });
        debugPrint("Items " + count.toString());
      });
    });
  }

  void navigateToDetail(DriverDBAdd todo) async {
    bool result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => AddDriver(todo)),
    );
    if (result == true) {
      getData();
    }
  }

}