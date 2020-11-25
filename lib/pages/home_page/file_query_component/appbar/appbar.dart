import 'package:flutter/material.dart';

Widget queryAppBar(){
  return AppBar(
    titleSpacing: 100,
    toolbarHeight: 60,
    primary: true,
    title: Text("批量查询", style: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),),
    centerTitle: true,
    toolbarOpacity: 1.0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    actions: <Widget>[
//      IconButton(
//        icon: Icon(Icons.share),
//        onPressed: (){},
//      )
    ],
  );
}