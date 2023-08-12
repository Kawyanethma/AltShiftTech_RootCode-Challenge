import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(WelcomeScreen());
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/welcome bg.png"),
                  fit: BoxFit.cover)),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                  width: 10,
                ),
                Image.asset("images/logo.png", width: 150),
                const SizedBox(height: 15),
                Text(
                  'Est molestie\ntellus dolor ut\nnibh id\nfermentum.',
                  style: GoogleFonts.jura(
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),
                Text(
                  'Ultrices bibendum porttitor\n orci eu in in tellus posuere\n tellus. Arcu.',
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
