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
  final String url = "https://swapi.co/api/starships";
  List data;

  Future<String> getSwData() async {
    var res = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"},
    );

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["results"];
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Star Wars Starships"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {

        },
      ),
    );
  }
}
