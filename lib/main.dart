import 'package:flutter/material.dart';
import 'package:manashmanashmanash/homepage/homepage.dart';

import 'package:manashmanashmanash/resource/apiData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: HomePage());
  }
}
