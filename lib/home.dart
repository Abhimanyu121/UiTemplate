import 'package:flutter/material.dart';
class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(54), topRight: Radius.circular(5), bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5) ),
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: Text("Random text"),
          )
        ],
      ),
    );
  }

}