import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

class Driver extends StatefulWidget {
  @override
  _DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[50],
      child: ListView.builder(
        itemCount: 40,
        itemBuilder: (BuildContext context,int index){
          return Container(
          child: SimpleFoldingCell(
          frontWidget:  frontWidget(),
          innerTopWidget: innerTopWidget(),
          innerBottomWidget: innerBottomWidget(),
          cellSize: Size(MediaQuery.of(context).size.width, 170),
          animationDuration: const Duration(milliseconds: 150),
          padding: EdgeInsets.all(6.0),
          ),
          );
        },
      ),
    );
  }
}

Container frontWidget() {
  return Container(
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
                    Text("Driver Name",style: TextStyle(
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
              Text("9876543210",style: TextStyle(fontSize: 20),),
            ],
            ),
            Row(
              children: <Widget>[
              Text("Vehicle ID:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Text("9876543210",style: TextStyle(fontSize: 20),),
            ],
            )
          ],
        ),),
      ))
    ],
    ),
  );
}
Container innerTopWidget() {
     return Container(
    color: Colors.red[50],
    alignment: Alignment.center,
    child: Row(children: <Widget>[
      Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
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
                    Text("Driver Name",style: TextStyle(
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
            borderRadius: BorderRadius.only(topRight: Radius.circular(16.0)),
            color: Color.fromARGB(100, 255, 222, 172),
        ),
      ))
    ],
    ),
  );
  }
Container  innerBottomWidget() {
  return Container(
    child: Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(100, 255, 222, 172),
          border: Border.all(width: 1,color: Colors.grey),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0))
      ),
    ),
  );
}
