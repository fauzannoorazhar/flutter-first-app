import 'package:flutter/material.dart';
import 'package:myapp/page/ListGunungPage.dart';
import 'page/ListViewPage.dart';


void main() {
    runApp(
        new MaterialApp(
            //home: new ListViewPage(),
            home: new ListGunungPage(),
            theme: ThemeData (
                primarySwatch: Colors.blue,
                primaryColor: Colors.white
            ), 
        )
    );
}