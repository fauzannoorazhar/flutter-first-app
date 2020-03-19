import 'package:flutter/material.dart';

class ListGunungPage extends StatefulWidget {
    @override
    _ListGunungPageState createState() => _ListGunungPageState(); 
}

class _ListGunungPageState extends State<ListGunungPage> {
    @override
    Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text('Daftar Gunung Indonesia'),
            ),
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        children: [
                            SectionTitle(
                                title: 'Lorem Ipsum' 
                            ),
                            SizedBox(
                                height: 300,
                                child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            SizedBox(
                                                height: 184,
                                                child: Stack(
                                                    children: [
                                                        Positioned.fill(
                                                            child: Ink.image(
                                                                image: AssetImage(
                                                                    'assets/images/images-card.jpg'
                                                                ),
                                                                fit: BoxFit.cover,
                                                                child: Container(),
                                                            ),
                                                        ),
                                                        Positioned(
                                                            bottom: 16,
                                                            left: 16,
                                                            right: 16,
                                                            child: FittedBox(
                                                                fit: BoxFit.scaleDown,
                                                                alignment: Alignment.centerLeft,
                                                                child: Text(
                                                                    'Muhammad Fauzan Noor Azhar',
                                                                    style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),
                                                                ),
                                                            ),
                                                        ),
                                                    ]
                                                ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                                child: DefaultTextStyle(
                                                    softWrap: false,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: Theme.of(context).textTheme.subhead,
                                                    child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                            Padding(
                                                                padding: const EdgeInsets.only(bottom: 8),
                                                                child: Text(
                                                                    'Text 2',
                                                                    style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black54)
                                                                ),
                                                            ),
                                                            Text('Bandung'),
                                                            Text('Lorem'),
                                                        ],
                                                    ),
                                                ),
                                            )
                                        ],
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            )
        );
    }
}

class SectionTitle extends StatelessWidget {
    const SectionTitle({
        Key key,
        this.title,
    }) : super(key: key);

    final String title;
    @override
    Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(title, style: Theme.of(context).textTheme.subhead),
            ),
        );
    }
}