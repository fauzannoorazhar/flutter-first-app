import 'package:flutter/material.dart';

class HorizontalListPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                    Container(
                        width: 160.0,
                        color: Colors.red,
                        margin: EdgeInsets.all(10),
                    ),
                    Container(
                        width: 160.0,
                        color: Colors.blue,
                        margin: EdgeInsets.all(10),
                    ),
                    Container(
                        width: 160.0,
                        color: Colors.yellow,
                        margin: EdgeInsets.all(10),
                    ),
                    Container(
                        width: 160.0,
                        color: Colors.green,
                        margin: EdgeInsets.all(10),
                    ),
                ],
            ),
        );
    }
}