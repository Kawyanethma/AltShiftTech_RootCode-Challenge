import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlyxButton1 extends StatelessWidget {
  final String title;
  final StatefulWidget page;

  const FlyxButton1({super.key, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: const Color.fromARGB(255, 49, 100, 221),
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onPressed: () {
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
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
