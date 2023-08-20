import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPageOne extends StatelessWidget {
  const BookingPageOne({super.key});

  void updateOriginList(String value) {
    //Function to filter list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 17, 17),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Origin',
              style: TextStyle(
                  color: Color.fromARGB(255, 242, 242, 242),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                style: TextStyle(color: Color.fromARGB(255, 242, 242, 242)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(242, 242, 242, 0.05),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(242, 242, 242, 0.07),
                          width: 2)),
                  hintText: "eg: CMB, SL, Earth",
                  hintStyle:
                      TextStyle(color: Color.fromRGBO(242, 242, 242, 0.6)),
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'Destination',
              style: TextStyle(
                  color: Color.fromARGB(255, 242, 242, 242),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                style: TextStyle(color: Color.fromARGB(255, 242, 242, 242)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(242, 242, 242, 0.05),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(242, 242, 242, 0.07),
                          width: 2)),
                  hintText: "eg: DXD, Bridgehead, Pandora",
                  hintStyle:
                      TextStyle(color: Color.fromRGBO(242, 242, 242, 0.6)),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(242, 242, 242, 0.05),
                    side:
                        BorderSide(color: Color.fromRGBO(242, 242, 242, 0.07)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: Text(
                    'Travel mode',
                    style: TextStyle(
                      color: Color.fromRGBO(242, 242, 242, 1),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(242, 242, 242, 0.05),
                    side:
                        BorderSide(color: Color.fromRGBO(242, 242, 242, 0.07)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: Text(
                    'Price',
                    style: TextStyle(
                      color: Color.fromRGBO(242, 242, 242, 1),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(242, 242, 242, 0.05),
                    side:
                        BorderSide(color: Color.fromRGBO(242, 242, 242, 0.07)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: Text(
                    'Departure',
                    style: TextStyle(
                      color: Color.fromRGBO(242, 242, 242, 1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(242, 242, 242, 0.05),
                  side: BorderSide(color: Color.fromRGBO(242, 242, 242, 0.07)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                child: Text(
                  'Travel mode',
                  style: TextStyle(
                    color: Color.fromRGBO(242, 242, 242, 1),
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Text(
              'Offers Available',
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
