import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';


void main() async {
  List<dynamic> data = await getData();

  runApp(MaterialApp(
    // home: TestHttp(),
    home: Scaffold(
       appBar: AppBar(
        title: const Text('Http Request'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: data.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, position) {
           if (position.isOdd) return const Divider();
            return ListTile(
              title: Text('${data[position]["title"]}',
              style:const TextStyle(
                fontSize: 14.9,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey
              ),),
              subtitle: Text('${data[position]["body"]}',
              style: const TextStyle(
                fontSize: 12.9,
                fontWeight: FontWeight.w500,

              ),),
              leading: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Text(data[position]["title"][0].toString().toUpperCase(),
                style: const TextStyle(
                  fontSize: 15.9,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent
                ),),
              ),
            );
          }
        ),
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