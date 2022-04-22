import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() async {
  List<dynamic> _data = await _getData();

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Profile Users'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, position) {
            return ListTile(
              // title: Text('${_data[position]["name"]}'),
              title: Card(
                child: Column(
                  children: [
                    Text('Name: ${_data[position]["name"]}'),
                    Text('${_data[position]["username"]}'),
                  ],
                ),
              ),
            );
          }),
    ),
  ));
}

Future<List> _getData() async {
  String apiUrl = 'jsonplaceholder.typicode.com';
  Response response = await get(Uri.https(apiUrl, 'users'));

  return jsonDecode(response.body);
}
