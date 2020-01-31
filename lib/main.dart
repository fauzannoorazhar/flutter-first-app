import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    static const String _title = 'My Portofolio';
    
    // This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		//debugShowCheckedModeBanner: false,
		title: _title,
			theme: ThemeData (
				// This is the theme of your application.
				//
				// Try running your application with "flutter run". You'll see the
				// application has a blue toolbar. Then, without quitting the app, try
				// changing the primarySwatch below to Colors.green and then invoke
				// "hot reload" (press "r" in the console where you ran "flutter run",
				// or simply save your changes to "hot reload" in a Flutter IDE).
				// Notice that the counter didn't reset back to zero; the application
				// is not restarted.
				primarySwatch: Colors.blue,
                primaryColor: Colors.white
			),
			home: Scaffold(
                appBar: AppBar(title: const Text(_title)),
                body: MyStatelessWidget(),
            ),
		);
	}
}

class MyStatelessWidget extends StatelessWidget {
    MyStatelessWidget({Key key}) : super(key : key);

    Widget build(BuildContext context) {
        return Container(
            child: Column(
                children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.greenAccent,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                            children: <Widget>[
                                Container(
                                    margin: EdgeInsets.all(25),
                                    child: Image(
                                        image: AssetImage('assets/profil.jpg'),
                                        width: 200,
                                    ),
                                ),
                                Text(
                                    'MUHAMMAD FAUZAN NOOR AZHAR',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                ),
                                Text(
                                    'SOFTWARE ENGINEER',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black
                                    ),
                                )
                            ],
                        )
                    ),
                    Row()
                ],
            ),
        );
    }
}