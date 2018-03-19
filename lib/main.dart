import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StarWarsData(),
  ));
}

class StarWarsData extends StatefulWidget {
  @override
  _StarWarsDataState createState() => new _StarWarsDataState();
}

class _StarWarsDataState extends State<StarWarsData> {
  final String url = 'https://swapi.co/api/starships';
  List data;

  Future<String> getSwData() async {
    var res = await http.get(
      Uri.encodeFull(url),
      headers: {'Accept': 'application/json'},
    );

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody['results'];
    });

    return 'Success!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Wars Starships'),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        data[index]['name'],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        data[index]['model'],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //this.getSwData();
  }
}
