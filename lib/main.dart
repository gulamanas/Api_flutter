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
           final index = position ~/2;
            return ListTile(
              title: Text('${data[index]["title"]}',
              style:const TextStyle(
                fontSize: 14.9,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey
              ),),
              subtitle: Text('${data[index]["body"]}',
              style: const TextStyle(
                fontSize: 12.9,
                fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic
              ),),
              leading: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Text(data[index]["title"][0].toString().toUpperCase(),
                style: const TextStyle(
                  fontSize: 15.9,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),),
              ),
              onTap: () {
                _showOnTapMessage(context, "${data[index]["title"]}");
                // print("${data[index]["id"]}");
              },
            );
            
          }
        ),
      )
    )
  )  );
}

void _showOnTapMessage(BuildContext context, String message) {
  // var alert = AlertDialog(
  //     title: Text('App'),
  //     content: Text(message),
  //     actions: [
  //       TextButton(
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //          child: Text('OK')
  //       )
  //     ],
  // );
  showDialog(context: context, builder: (BuildContext context) => AlertDialog(
    title: Text('App'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
           child: Text('OK')
        )
      ],
  ));
}

 Future<List> getData() async {
    String apiUrl = 'jsonplaceholder.typicode.com';
    Response response = await get(Uri.https(apiUrl, 'posts'));

    // return jsonDecode(response.body);
    return jsonDecode(response.body);
    // print(response.body);
  }