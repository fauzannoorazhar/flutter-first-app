import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		debugShowCheckedModeBanner: false,
		title: 'Welcome To Flutter',
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
			home: RandomWords(),
		);
	}
}

class RandomWordsState extends State<RandomWords> {
	final List<WordPair> _list = <WordPair>[];
	final TextStyle _textStyle = const TextStyle(fontSize: 18);
	final Set<WordPair> _saved = Set<WordPair>();

	Widget _buildList() {
		return ListView.builder(
			padding: const EdgeInsets.all(16),
			itemBuilder: (BuildContext _context, int i) {
				if (i.isOdd) {
					return Divider();
				}

				final int index = i ~/ 2;
				
				if (index >= _list.length) {
					_list.addAll(generateWordPairs().take(10));
				}
				
				return _buildRow(_list[index]);
			}
		);
	}

	Widget _buildRow(WordPair pair) {
		 final bool alreadySaved = _saved.contains(pair);

		return ListTile(
			title: Text(
				pair.asPascalCase,
				style: _textStyle,
			),
            trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null
            ),
            onTap: () {
                setState(() {
                    if (alreadySaved) {
                        _saved.remove(pair);
                    } else {
                        _saved.add(pair);
                    }
                });
            },
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Startup Name Generator'),
                actions: <Widget>[
                    IconButton(icon:  Icon(Icons.list), onPressed: _pushSaved),
                ],
			),
			body: _buildList(),
		);
	}

    void _pushSaved() {
        Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) {
                    final Iterable<ListTile> tiles = _saved.map(
                        (WordPair pair) {
                            return ListTile(
                                title: Text(
                                    pair.asPascalCase,
                                    style: _textStyle,
                                ),
                            );
                        },
                    );
                    final List<Widget> divided = ListTile.divideTiles(
                        context: context,
                        tiles: tiles,
                    )
                    .toList();

                    return Scaffold(
                        appBar: AppBar(
                            title: Text('Saced Suggestion'),
                        ),
                        body: ListView(children: divided),
                    );
                },
            )
        );
    }
}

class RandomWords extends StatefulWidget {
	@override
	RandomWordsState createState() => RandomWordsState();
}

