import 'package:flutter/material.dart';

TextStyle headerStyle = TextStyle(
  color: Colors.white,
  fontSize: 60.0,
  fontWeight: FontWeight.w900,
  fontFamily: "PoppinsBlack",
  shadows: <Shadow>[
    Shadow(
      offset: Offset(0.0, 0.0),
      blurRadius: 3,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);

TextStyle linkTextStyle = TextStyle(
  color: Colors.blue,
  fontSize: 20.0,
  fontFamily: "PoppinsRegular",
);

TextStyle bodyTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontFamily: "PoppinsRegular",
);
