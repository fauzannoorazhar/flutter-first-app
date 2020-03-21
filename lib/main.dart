import 'package:flutter/material.dart';
import 'package:myapp/Example1Page.dart';
import 'package:myapp/GridViewPage.dart';
import 'package:myapp/HorizontalListPage.dart';
import 'package:myapp/MixedListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
	    return new MaterialApp(
            home: new Example1Page(),
            theme: ThemeData (
                primarySwatch: Colors.blue,
                primaryColor: Colors.white
            ), 
        );
	}
}