import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ListViewPage extends StatefulWidget {
    @override
    ListViewPageState createState() {
        return new ListViewPageState();
    }
}
  
class ListViewPageState extends State<ListViewPage> {
    List list;
    String url = 'https://jsonplaceholder.typicode.com/posts';

    Future<String> getData() async {
        var response = await http.get(
            Uri.encodeFull(url),
            headers: {
                "Accept": "application/json"
            }
        );

        this.setState(() {
            list = json.decode(response.body);
        });

        print(list[0]["title"]);

        return "Success!";
    }

    @override
    void initState() {
        super.initState();
        this.getData();
    }

    @override 
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text("ListViews with JSON Data"),
                backgroundColor: Colors.blue
            ),
            body: new ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: list == null ? 0 : list.length,
                itemBuilder: (BuildContext context, int index) {
                    if (index.isOdd) {
                        return Divider();
                    }
                    return ListTile(
                        title: Text(
                            list[index]['title'],
                            style: TextStyle(fontSize: 18),
                        ),
                    );
                }
            ),
        );
    }
}