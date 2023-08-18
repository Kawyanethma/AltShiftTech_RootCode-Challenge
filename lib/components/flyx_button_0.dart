import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlyxButton0 extends StatelessWidget {
  final String title;
  final StatefulWidget page;

  const FlyxButton0({super.key, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: const Color.fromARGB(255, 49, 100, 221),
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onPressed: () {
          //going to signup from
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: GoogleFonts.lato(
                fontSize: 23, fontWeight: FontWeight.w400, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
