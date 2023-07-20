import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'AppModule/Home/view/feed_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FeedView(),
    );
  }
}
