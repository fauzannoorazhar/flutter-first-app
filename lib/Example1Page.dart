import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as dev;

class Example1Page extends StatefulWidget {
    @override
    _Example1PageState createState() => _Example1PageState(); 
}

class _Example1PageState extends State<Example1Page> {
    List<Gunung> listGunung = new List<Gunung>();

    @override
    Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text('Daftar Gunung Indonesia'),
            ),
            body: this._listViewGunung(),
        );
    }

    _listViewGunung() {
        return FutureBuilder<List<Gunung>> (
            future: _getListGunung(),
            builder: (context, snapshot) {
                if (snapshot.hasData) {
                    List<Gunung> data = snapshot.data;
                    if (data.length == 0) {
                        return Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Data Tidak Ditemukan"),  
                        );
                    }

                    return SafeArea(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Column(
                                children: <Widget>[
                                    Container(
                                        child: SectionTitle(
                                            title: 'Daftar Gunung' 
                                        ),
                                    ),
                                    Expanded(
                                        child: ListView.builder(
                                            itemCount: data.length,
                                            itemBuilder: (context, index) {
                                                return listCardGunung(context, data, index);
                                            },
                                        ),
                                    )
                                ],
                            ),
                        ),
                    );

                } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                }

                // return Center(
                //     child: CircularProgressIndicator(),
                // );
                return Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: Text("Data Tidak Ditemukan"),
                    ),  
                );
            },
        ); 
    }

    Future<List<Gunung>> _getListGunung() async {
        var buffer = new StringBuffer();
        buffer.write('http://192.168.0.105/gunungku.com/web/index.php?r=api/gunung');
        String url = buffer.toString();
        var response = await http.get(url);

        if (response.statusCode == 200) {
            List jsonResponse = json.decode(response.body);
            listGunung = jsonResponse.map((gunung) => new Gunung.fetchData(gunung)).toList();
            
            return listGunung;
        } else {
            throw Exception("Tidak ada response");
        }
    }

    Widget listCardGunung(BuildContext context, data , index) {
        return SizedBox(
            child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
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
                                                data[index].nama,
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
                                                'Ketinggian : ' + data[index].ketinggian.toString(),
                                                style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black54)
                                            ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(bottom: 8),
                                            child: Text('Jenis Gunung : ' + data[index].lokasi)
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(bottom: 8),
                                            child: Text('Jenis Gunung : ' + data[index].jenis_gunung),
                                        ),
                                    ],
                                ),
                            ),
                        )
                    ],
                ),
            ),
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

class Gunung {
    String nama;
    String deskripsi;
    int ketinggian;
    String jenis_gunung;
    String status_aktif;
    String link_map;
    String path_gambar;
    String lokasi;

    Gunung({
        this.nama,
        this.deskripsi,
        this.ketinggian,
        this.jenis_gunung,
        this.status_aktif,
        this.link_map,
        this.path_gambar,
        this.lokasi
    });

    factory Gunung.fetchData(Map<String, dynamic> json) {
        return Gunung(
            nama: json['nama'],
            deskripsi: json['deskripsi'],
            ketinggian: json['ketinggian'],
            jenis_gunung: json['jenis_gunung'],
            status_aktif: json['status_aktif'],
            link_map: json['link_map'],
            path_gambar: json['path_gambar'],
            lokasi: json['lokasi']
        );
    }
}