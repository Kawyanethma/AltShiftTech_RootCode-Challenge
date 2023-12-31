import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flyx/components/address_text_field.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../auth/auth.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final addressController = TextEditingController();
  List<dynamic> planets = [];

  String? planetId;
  String? dropdownvalue1;
  String? dropdownvalue2;

  @override
  void initState() {
    super.initState();

    this.planets.add({"id": 1, "label": "Earth"});
    this.planets.add({"id": 2, "label": "Mercurry"});
    this.planets.add({"id": 3, "label": "Mars"});
    this.planets.add({"id": 4, "label": "Jupiter"});
    this.planets.add({"id": 5, "label": "Venus"});
  }

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
          /*FormHelper.dropDownWidget(
            context,
            "Select Planet",
            this.planetId,
            this.planets,
            (onChangedVaL){
              this.planetId =onChangedVaL;
              print("$onChangedVaL")
            },
            (onValidateVaL){
              if(onValidateVaL ==null){
                return 'Please Select Planet';
              }
              return null;
            }

          )*/
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
              value: dropdownvalue1,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue1 = newValue!;
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
            'Country',
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
              value: dropdownvalue2,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue2 = newValue!;
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
