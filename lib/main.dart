import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

void main() async {
  Map _data = await getData();

  List _features = _data['features'];

  // print(_data);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quake App',
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _features.length,
        itemBuilder: (BuildContext context, int position) {
          if (position.isOdd) return const Divider();
          final index = position ~/2; // we are dividing position by 2 and returning an integer result

          var format = DateFormat.yMMMMd("en_US").add_jm();

          var date = format.format(DateTime.fromMicrosecondsSinceEpoch(_features[index]['properties']['time'] * 1000, isUtc: true ) );

          return ListTile(
            title: Text(date),
            subtitle: Text(
              "${_features[index]["properties"]["place"]}"
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                '${_features[index]["properties"]["mag"]}'
              ),
            ),
            onTap: () {_showOnTapMessage(context, "${_features[index]["properties"]["title"]}");
            }
          );
        }
      ),
      ),
  ));
}

void _showOnTapMessage(BuildContext context, String message) {
  showDialog(context: context,
   builder: (BuildContext context) => AlertDialog(
     title: Text('Quakes'),
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

Future<Map> getData() async {
 String apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
 Response response = await get(Uri.parse(apiUrl));

 return jsonDecode(response.body);
}