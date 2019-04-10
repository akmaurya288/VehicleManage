import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Paper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PaperState();
}

class PaperState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Padding(padding: EdgeInsets.only(left: 5,right: 5,bottom: 1,top: 1),
                  child: Material(
                    elevation: 5,
                    child:
                    Container(
                      color: Colors.red[50],
                      child: StaggeredGridView.count(
                        crossAxisCount: 2, crossAxisSpacing: 6.0, mainAxisSpacing: 6.0, padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 6.0),
                        children: <Widget>[
                          Chips(),
                          Chips(),
                          Chips(),
                          Chips(),
                          Chips(),
                          Chips(),

                        ],
                        staggeredTiles: [
                          StaggeredTile.extent(1, 25),
                          StaggeredTile.extent(1, 25),
                          StaggeredTile.extent(1, 25),
                          StaggeredTile.extent(1, 25),
                        ],
                      ),
                    )
                  )
              )
          ),
          Expanded(
              flex: 1,
              child: Padding(padding: EdgeInsets.only(left: 5,right: 5,bottom: 1,top: 1),
                  child: Material(
                    elevation: 5,
                    child: Container(

                    ),
                  )
              )
          ),
          Expanded(
              flex: 1,
              child: Padding(padding: EdgeInsets.only(left: 5,right: 5,bottom: 1,top: 1),
                  child: Material(
                    elevation: 5,
                    child: Container(

                    ),
                  )
              )
          ),
          Expanded(
              flex: 1,
              child: Padding(padding: EdgeInsets.only(left: 5,right: 5,bottom: 1,top: 1),
                  child: Material(
                    elevation: 5,
                    child: Container(

                    ),
                  )
              )
          ),
        ],
      )
    );
  }
}

class Chips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2.5,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(6.0),
    );
  }
}

