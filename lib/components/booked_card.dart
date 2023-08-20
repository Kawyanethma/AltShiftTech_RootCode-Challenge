import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookedCard extends StatelessWidget {
  const BookedCard({
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
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'CMD',
                    style: GoogleFonts.lato(
                        fontSize: 27,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  Text(
                    'Colombo',
                    style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 169, 169, 169)),
                  ),
                  Text(
                    'Earth',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ],
              ),
              Image.asset("images/Rockets.png", width: 100),
              Column(
                children: [
                  Text(
                    'DXB',
                    style: GoogleFonts.lato(
                        fontSize: 27,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Bridgehead',
                    style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 169, 169, 169)),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Pandora',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: Color.fromARGB(56, 189, 189, 189),
          thickness: 1,
          indent: 15,
          endIndent: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            children: [
              Text(
                'Travel Dates',
                style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 234, 234, 234)),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '12 August',
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 169, 169, 169)),
                      ),
                      Text(
                        'Sunday',
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Image.asset("images/Line.png", width: 100),
                  Column(
                    children: [
                      Text(
                        '12 August',
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 169, 169, 169)),
                      ),
                      Text(
                        'Sunday',
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: Color.fromARGB(56, 189, 189, 189),
          thickness: 1,
          indent: 15,
          endIndent: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Passenger and Cabin Class',
            style: GoogleFonts.lato(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 169, 169, 169)),
          ),
        ),
        Text(
          '2 Adults in Economy',
          style: GoogleFonts.lato(
              fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white),
        ),
      ]),
    );
  }
}
