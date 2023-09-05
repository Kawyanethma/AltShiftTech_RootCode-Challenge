import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/offer_card.dart';

class BookingPageOne extends StatefulWidget {
  const BookingPageOne({super.key});

  @override
  State<BookingPageOne> createState() => _BookingPageOneState();
}

class _BookingPageOneState extends State<BookingPageOne> {
  var curUser = FirebaseAuth.instance.currentUser;
  final origin = TextEditingController();
  final destination = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Origin',
                style: TextStyle(
                    color: Color.fromARGB(255, 242, 242, 242),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                  controller: origin,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 242, 242, 242)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(242, 242, 242, 0.05),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(242, 242, 242, 0.07),
                            width: 2)),
                    hintText: "eg: CMB, SL, Earth",
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(242, 242, 242, 0.6)),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Destination',
                style: TextStyle(
                    color: Color.fromARGB(255, 242, 242, 242),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                  controller: destination,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 242, 242, 242)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(242, 242, 242, 0.05),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(242, 242, 242, 0.07),
                            width: 2)),
                    hintText: "eg: DXD, Bridgehead, Pandora",
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(242, 242, 242, 0.6)),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor:
                          const Color.fromRGBO(242, 242, 242, 0.05),
                      side: const BorderSide(
                          color: Color.fromRGBO(242, 242, 242, 0.07)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.card_travel,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Travel Mode',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(242, 242, 242, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor:
                          const Color.fromRGBO(242, 242, 242, 0.05),
                      side: const BorderSide(
                          color: Color.fromRGBO(242, 242, 242, 0.07)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.monetization_on,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(242, 242, 242, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor:
                          const Color.fromRGBO(242, 242, 242, 0.05),
                      side: const BorderSide(
                          color: Color.fromRGBO(242, 242, 242, 0.07)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.departure_board,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Departure',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(242, 242, 242, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              MaterialButton(
                  color: const Color.fromARGB(255, 49, 100, 221),
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  onPressed: () async {
                    //ticket booking method
                    final originArr = origin.text;
                    final splitO = originArr.split(',');
                    final Map<int, String> originvalues = {
                      for (int i = 0; i < splitO.length; i++) i: splitO[i]
                    };
                    final destinationArr = destination.text;
                    final splitD = destinationArr.split(',');
                    final Map<int, String> destinationvalues = {
                      for (int i = 0; i < splitD.length; i++) i: splitD[i]
                    };
                    try {
                      //this function adding booking details to firebase
                      final user = FirebaseFirestore.instance
                          .collection('Users')
                          .doc(curUser!.email);
                      user.update({
                        'booked': true,
                      });
                      final booking = FirebaseFirestore.instance
                          .collection('Users')
                          .doc(curUser!.email)
                          .collection('bookings')
                          .doc('ticket');
                      final json = {
                        'destinationCity': destinationvalues[0],
                        'destinationCounty': destinationvalues[1],
                        'destinationPlanet': destinationvalues[2],
                        'originCity': originvalues[0],
                        'originCounty': originvalues[1],
                        'originPlanet': originvalues[2],
                      };
                      await booking.set(json);
                      Fluttertoast.showToast(
                          msg: 'Your ticket is booked',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } on FirebaseException catch (e) {
                      Fluttertoast.showToast(
                          msg: e.code,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Book Now',
                      style: GoogleFonts.lato(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Offers Available',
                style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 90,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OfferCard(
                          title: '12.0%',
                          description: 'Reduction',
                          path: 'images/boximg1.png'),
                      OfferCard(
                          title: '49.0%',
                          description: 'Oxygen Supples',
                          path: 'images/boximg2.png'),
                      OfferCard(
                          title: '12.0%',
                          description: 'New offers',
                          path: 'images/boximg3.png')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
