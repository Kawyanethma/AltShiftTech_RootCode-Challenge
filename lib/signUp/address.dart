import 'package:flutter/material.dart';
import 'package:flyx/components/address_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/flyx_button_1.dart';

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
        body: Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/Signup_img_1.png"),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 27,
                            ),
                          )
                        ],
                      ),
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
                const Column(
                  children: [FlyxButton1(title: 'Finish', page: Address())],
                )
              ],
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
