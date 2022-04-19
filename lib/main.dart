import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';


void main() async {
  List<dynamic> data = await getData();
  // print(data['title']);
  String body = "";

  for (int i = 0; i< data.length; i++ ) {

  }
  body = data[0]["body"];


  runApp(MaterialApp(
    // home: TestHttp(),
    home: Scaffold(
       appBar: AppBar(
        title: const Text('Http Request'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Body: $body'),
      )
    )
  )  );
}

 Future<List> getData() async {
    String apiUrl = 'jsonplaceholder.typicode.com';
    Response response = await get(Uri.https(apiUrl, 'posts'));

    // return jsonDecode(response.body);
    return jsonDecode(response.body);
    // print(response.body);
  }