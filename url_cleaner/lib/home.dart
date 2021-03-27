// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';

import 'styles.dart';

class Home extends StatelessWidget {
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "URL Cleaner",
              style: headerStyle,
            ),
            // TODO: fix the text overflow on mobile
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "A tool to clean URLs before you share them. Inspired by ",
                    style: bodyTextStyle,
                  ),
                  TextButton(
                    child: Text(
                      "Jordan Singer",
                      style: linkTextStyle,
                    ),
                    onPressed: () {
                      js.context
                          .callMethod('open', ['https://twitter.com/jsngr']);
                    },
                  ),
                  Text(
                    " and ",
                    style: bodyTextStyle,
                  ),
                  TextButton(
                    child: Text(
                      "Ryan Hoover",
                      style: linkTextStyle,
                    ),
                    onPressed: () {
                      js.context
                          .callMethod('open', ['https://twitter.com/rrhoover']);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 100.0, right: 100.0, bottom: 16.0),
              child: TextField(
                controller: urlController,
                decoration: InputDecoration(
                  hintText: "Paste your link here",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(115, 255, 255, 255),
                  ),
                ),
                autofocus: true,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: add functionality
                String urlToClean = urlController.text;
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "CLEAN",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
