import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_demo/view/google_map/google_map_view.dart';
import 'package:map_demo/view/permission_demo/permission_demo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo Google Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PermissionView(),
    );
  }
}
