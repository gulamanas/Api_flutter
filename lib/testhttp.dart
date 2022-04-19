import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TestHttp extends StatefulWidget {
  const TestHttp({ Key? key }) : super(key: key);

  @override
  State<TestHttp> createState() => _TestHttpState();
}

class _TestHttpState extends State<TestHttp> {



  Future<String> getData() async {
    String apiUrl = 'jsonplaceholder.typicode.com';
    Response response = await get(Uri.https(apiUrl, 'posts'));

    print(response.body);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Request'),
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
                  children: [
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
    );
  }
}