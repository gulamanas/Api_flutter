import 'package:flutter/material.dart';
import 'dart:convert';
// import './testhttp.dart';
import 'package:http/http.dart';


void main() async {
  List data = await getData();
  print(data[1]);

  runApp(MaterialApp(
    // home: TestHttp(),
    home: Scaffold(
       appBar: AppBar(
        title: const Text('Http Request'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Lorem ipsum title',
                      style: TextStyle(
                        color:Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.6
                      ),
                    ),
                    Text(
                      'Lorem ipsum title',
                      style: TextStyle(
                        color:Colors.black54,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
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