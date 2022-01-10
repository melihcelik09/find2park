import 'dart:convert';
import 'package:flutter/material.dart';

class DropDownLocation extends StatefulWidget {
  @override
  _DropDownLocationState createState() => _DropDownLocationState();
}

class _DropDownLocationState extends State<DropDownLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('json/il-ilce.json'),
            builder: (context, snapshot) {
              var myData = jsonDecode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(children: [
                      Text(myData[index]['ilceleri'].toString()),
                    ]),
                  );
                },
                itemCount: myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
