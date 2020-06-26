import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/overview/overview_screen.dart';

class BubbleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Timer Concept',
      theme: ThemeData(
        canvasColor: Color(0xff121231),
        cardColor: Color(0xff1B1D3C),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme.copyWith(
                button: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                bodyText1: TextStyle(color: Colors.white),
                bodyText2: TextStyle(color: Colors.white),
                subtitle1: TextStyle(color: Colors.white),
                subtitle2: TextStyle(color: Colors.white),
                headline6: TextStyle(color: Colors.white),
                headline5: TextStyle(color: Colors.white),
                headline4: TextStyle(color: Colors.white),
                headline3: TextStyle(color: Colors.white),
                headline2: TextStyle(color: Colors.white),
                headline1: TextStyle(color: Colors.white),
              ),
        ),
      ),
      home: OverviewScreen(),
    );
  }
}
