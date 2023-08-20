import 'package:flutter/material.dart';
import 'package:flyx/components/address_text_field.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';

import '../auth/auth.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final addressController = TextEditingController();
  String? dropdownvalue;

  // List of items in dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 35,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 27,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/Signup_img_1.png"),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 100,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Personal Address',
                      style: GoogleFonts.lato(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    AddressTextField(
                      controller: addressController,
                      hintText: 'Joe',
                      title: 'First Name',
                    ),
                    const SizedBox(height: 15),
                    buildCountryDropButton(),
                    const SizedBox(height: 15),
                    buildPlanetDropButton(),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        DotStepper(
                          activeStep: 2,
                          dotCount: 3,
                          dotRadius: 10.0,
                          shape: Shape.pipe,
                          spacing: 5,
                          indicatorDecoration: const IndicatorDecoration(
                              color: Color.fromARGB(255, 49, 100, 221),
                              strokeColor: Color.fromARGB(255, 49, 100, 221)),
                          fixedDotDecoration: const FixedDotDecoration(
                            color: Color.fromARGB(90, 49, 101, 221),
                          ),
                        ),
                        MaterialButton(
                            color: const Color.fromARGB(255, 49, 100, 221),
                            minWidth: double.infinity,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const AuthPage()),
                                  (route) => false);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Finish",
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ))
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCountryDropButton() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Planet',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField(
              menuMaxHeight: 250,
              icon: const Icon(Icons.keyboard_arrow_down),
              iconEnabledColor: Colors.white,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(40, 255, 255, 255), width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(88, 255, 255, 255), width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(88, 255, 255, 255), width: 2)),
                filled: true,
                fillColor: const Color.fromARGB(18, 255, 255, 255),
              ),
              validator: (value) => value == null ? "Select a country" : null,
              dropdownColor: const Color.fromARGB(209, 0, 0, 0),
              value: dropdownvalue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList()),
        ],
      );

  Widget buildPlanetDropButton() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Planet',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField(
              menuMaxHeight: 250,
              icon: const Icon(Icons.keyboard_arrow_down),
              iconEnabledColor: Colors.white,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(40, 255, 255, 255), width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(88, 255, 255, 255), width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(88, 255, 255, 255), width: 2)),
                filled: true,
                fillColor: const Color.fromARGB(18, 255, 255, 255),
              ),
              validator: (value) => value == null ? "Select a country" : null,
              dropdownColor: const Color.fromARGB(209, 0, 0, 0),
              value: dropdownvalue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList()),
        ],
      );
}
