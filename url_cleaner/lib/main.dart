import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(URLCleaner());
}

class URLCleaner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "URL Cleaner",
      home: Home(),
    );
  }
}
