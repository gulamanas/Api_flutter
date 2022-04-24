import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() async {
  List<dynamic> _data = await _getData();

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Profile Users'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, position) {
            return ListTile(
              // title: Text('${_data[position]["name"]}'),
              title: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(
                        '${_data[position]["name"]}',
                        style: const TextStyle(
                            fontSize: 18.5, fontWeight: FontWeight.bold),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Username:'),
                          Text('${_data[position]["username"]}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Email :'),
                          Text('${_data[position]["email"]}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Phone :'),
                          Text('${_data[position]["phone"]}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Website :'),
                          Text('${_data[position]["website"]}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Address :'),
                          Text(
                              '${_data[position]["address"]["street"]}, ${_data[position]["address"]["city"]}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Company :'),
                          Text('${_data[position]["name"]}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                _showOnTapMessage(context, "${_data[position]["name"]}");
              },
            );
          }),
    ),
  ));
}

void _showOnTapMessage(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text('App'),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          ));
}

Future<List> _getData() async {
  String apiUrl = 'jsonplaceholder.typicode.com';
  Response response = await get(Uri.https(apiUrl, 'users'));

  return jsonDecode(response.body);
}
