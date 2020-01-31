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
			home: MyHomePage(title : 'Flutter Demo Home Page')
		);
	}
}

class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key : key);
    final String title;

    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    int _counterIncrement = 0;

    void _incrementCounter() {
        setState(() {
          _counterIncrement++;
        });
    }

    void _decrementCounter() {
        setState(() {
          _counterIncrement--;
        });
    }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('You have pushed the button this many times:'),
                        Text(
                            '$_counterIncrement',
                            style: Theme.of(context).textTheme.display1,
                        ),
                        Row(
                            children: <Widget>[
                               Expanded(
                                   child: RaisedButton(
                                       onPressed: _incrementCounter,
                                       child: Icon(Icons.add),
                                   ),
                               ),
                               Expanded(
                                   child: RaisedButton(
                                       onPressed: _decrementCounter,
                                       child: Icon(Icons.remove),
                                   ),
                               ),
                            ],
                        )
                    ],
                )
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
            ),
        );
    }
}