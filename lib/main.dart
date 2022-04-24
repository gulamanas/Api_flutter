import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

void main() async {
  Map _data = await getData();

  print(_data);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quake App',
        ),
        centerTitle: true,
      ),
      ),
  ));
}

Future<Map> getData() async {
 String apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
 Response response = await get(Uri.parse(apiUrl));

 return jsonDecode(response.body);
}