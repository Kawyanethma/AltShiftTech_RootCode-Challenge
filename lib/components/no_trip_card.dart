import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

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
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: MaterialButton(
                      color: const Color.fromARGB(255, 49, 100, 221),
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      onPressed: () {
                        
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Book a Trip',
                          style: GoogleFonts.lato(
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )))
            ],
          ),
        ));
  }
}
