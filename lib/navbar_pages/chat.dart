import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 17, 17, 17),
          title: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/Ellipse 2.png"),
              const SizedBox(width: 20),
              Text(
                'FlyChat',
                style: GoogleFonts.inter(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/planet.png",
            width: 100,
          ),
          const SizedBox(height: 40),
          const Text(
            'This Feature coming soon !',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      )),
    );
  }
}
