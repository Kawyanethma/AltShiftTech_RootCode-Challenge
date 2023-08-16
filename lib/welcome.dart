import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                      'Explore Cosmic\nAdventures\nYour Journey\nBegins Here!',
                      style: GoogleFonts.jura(
                          fontSize: 45,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Discover celestial wonders, plan\nyour interstellar adventures.',
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'If you have an account',
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                            onPressed: () {
                              //going to login page
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.lato(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      const Color.fromARGB(255, 242, 184, 32)),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                    const SizedBox(height: 5),
                    MaterialButton(
                        color: const Color.fromARGB(255, 49, 100, 221),
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        onPressed: () {
                          //going to signup from
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.lato(
                                fontSize: 23,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
