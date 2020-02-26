import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		debugShowCheckedModeBanner: false,
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
                primaryColor: Colors.blue
			),
			home: LoginPage(),
		);
	}
}

class LoginPage extends StatefulWidget {
	State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
	final TextEditingController _emailFilter = new TextEditingController();
	final TextEditingController _passwordFilter = new TextEditingController();
	String _email = "";
	String _password = "";
	FormType _form = FormType.login; // Our default setting is to login, and we should switch to creating an account when the user chooses to

	_LoginPageState() {
		_emailFilter.addListener(_emailListen);
		_passwordFilter.addListener(_passwordListen);
	}

	void _emailListen() {
		if (_emailFilter.text.isEmpty) {
			_email = "";
		} else {
			_email = _emailFilter.text;
		}
	}

	void _passwordListen() {
		if (_passwordFilter.text.isEmpty) {
			_password = "";
		} else {
			_password = _passwordFilter.text;
		}
	}

	// Swap in between our two forms, registering and logging in
	void _formChange() async {
		setState(() {
			if (_form == FormType.register) {
                _form = FormType.login;
            } else {
                _form = FormType.register;
            }
		});
	}

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text('Login Page'),
				centerTitle: true
			),
            body: Builder(
                builder: (context) => Container(
                padding: new EdgeInsets.all(16.0),
                child: new Column(
                    children: <Widget>[
                        _widgetTextFields(),
                        Container(
                            margin: EdgeInsets.all(8),
                        ),
                        _widgetButtons(context),
                    ],
                ),
            ),
            )
		);
	}

    Widget _widgetTextFields() {
        return new Container(
            child: new Column(
                children: <Widget>[
                    new Container(
                        child: new TextField(
                            controller: _emailFilter,
                            decoration: new InputDecoration(
                                labelText: 'Email'       
                            ),
                        ),
                    ),
                    new Container(
                        child: new TextField(
                            controller: _passwordFilter,
                            decoration: new InputDecoration(
                                labelText: 'Password'  
                            ),
                            obscureText: true,
                        )
                    )
                ],
            ),
        );
    }

    Widget _widgetButtons(BuildContext context) {
        if (_form == FormType.login) {
            return new Container(
                child: new Column(
                    children: <Widget>[
                        new RaisedButton(
                            onPressed: () => _loginPressed(context),
                            child: new Text('Login'),
                        ),
                        new FlatButton(
                            onPressed: _formChange,
                            child: new Text('Dont have an account? Tap here to register.'),
                        ),
                        new FlatButton(
                            onPressed: _passwordResetPressed, 
                            child: new Text('Forgot Password?')
                        ),
                    ],
                ),
            );
        } else {
            return new Container(
                child: new Column(
                    children: <Widget>[
                        new RaisedButton(
                            onPressed: _createAccountPressed,
                            child: new Text('Create an account'),
                        ),
                        new FlatButton(
                            onPressed: _formChange, 
                            child: new Text('Have an account? Click here to login')
                        ),
                    ],
                ),
            );
        }
    }

    void _loginPressed(BuildContext context) {
        final scaffold = Scaffold.of(context);
        scaffold.showSnackBar(
            SnackBar(
                content: Text('Selamat Datang $_email'),
            ),
        );
        print('The user wants to login with $_email and $_password');
    }

    void _createAccountPressed() {
        print('The user wants to create an accoutn with $_email and $_password');
    }

    void _passwordResetPressed() {
        print("The user wants a password reset request sent to $_email");
    }
}

// Used for controlling wheter the user is loggin or creating an account
enum FormType {
	login,
	register
}