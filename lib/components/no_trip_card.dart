import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../navbar_pages/book.dart';
import 'flyx_button_0.dart';

class NoTripCard extends StatelessWidget {
  const NoTripCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(31, 255, 255, 255), width: 1),
          color: const Color.fromARGB(22, 189, 189, 189),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                'No Upcoming Trips',
                style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: FlyxButton0(
                  page: Book(),
                  title: 'Book a Trip',
                ),
              )
            ],
          ),
        ));
  }
}
