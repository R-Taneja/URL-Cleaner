// ignore: avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    new Future<Null>.delayed(Duration.zero, () {
      ScaffoldMessenger.of(context).showSnackBar(
        new SnackBar(
          content: new Text(
              "Welcome! If you're using a mobile device, a more responsive UI is coming soon."),
        ),
      );
    });
    super.initState();
  }

  final TextEditingController urlController = TextEditingController();
  String cleanedURL = "";

  void cleanURL(String urlToClean) {
    cleanedURL = urlToClean;
    List<String> characters = urlToClean.split('');
    if (characters.contains("?")) {
      List<String> cleanedList = [];
      for (var char in characters) {
        if (char != "?") {
          cleanedList.add(char);
        }
        if (char == "?") {
          break;
        }
      }
      cleanedURL = cleanedList.join();
    }
    characters = cleanedURL.split('');
    if (characters.contains("#")) {
      List<String> cleanedList = [];
      for (var char in characters) {
        if (char != "#") {
          cleanedList.add(char);
        }
        if (char == "#") {
          break;
        }
      }
      cleanedURL = cleanedList.join();
    }
  }

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
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                "A tool to clean URLs before you share them.",
                style: bodyTextStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Inspired by ",
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
                Text(
                  ".",
                  style: bodyTextStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 100.0, right: 100.0, bottom: 25.0),
              child: TextField(
                autocorrect: false,
                controller: urlController,
                decoration: InputDecoration(
                  hintText: "Paste a URL here",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(115, 255, 255, 255),
                  ),
                ),
                autofocus: true,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PoppinsLight",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cleanURL(urlController.text);
                if (cleanedURL != urlController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text("Cleaned URL and copied it to the clipboard."),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("URL is as clean as possible!"),
                    ),
                  );
                }
                setState(() {
                  urlController.text = cleanedURL;
                });
                Clipboard.setData(
                  ClipboardData(text: cleanedURL),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "CLEAN",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "PoppinsRegular",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
