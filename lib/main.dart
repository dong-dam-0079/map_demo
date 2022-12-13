import 'package:flutter/material.dart';
import 'package:map_demo/view/google_map/google_map_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Google Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoogleMapView(),
    );
  }
}
