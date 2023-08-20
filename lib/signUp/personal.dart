import 'package:flutter/material.dart';
import 'package:flyx/components/name_text_field.dart';
import 'package:flyx/components/passport_text_field.dart';
import 'package:flyx/components/phone_text_field.dart';
import 'package:flyx/signUp/address.dart';
import 'package:flyx/signUp/email.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';

import '../components/flyx_button_1.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passportNumber = TextEditingController();
  final phoneNumber = TextEditingController();
  late String birthDay;
  DateTime dateTime = DateTime.now();

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
        backgroundColor: Colors.transparent,
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
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                    size: 100,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Personal Details',
                    style: GoogleFonts.lato(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  NameTextField(
                    controller: firstNameController,
                    hintText: 'Joe',
                    title: 'First Name',
                  ),
                  const SizedBox(height: 15),
                  NameTextField(
                    controller: lastNameController,
                    hintText: 'Doe',
                    title: 'Last Name',
                  ),
                  const SizedBox(height: 15),
                  PassportTextField(
                    controller: passportNumber,
                    hintText: '21212387361',
                    title: 'Passport Number',
                  ),
                  const SizedBox(height: 15),
                  PhoneTextField(
                    controller: phoneNumber,
                    hintText: '071 123 4567',
                    title: 'Phone Number',
                  ),
                  const SizedBox(height: 15),
                  buildDatePicker(),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      DotStepper(
                        activeStep: 1,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Email()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
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
      ),
    );
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        if (value == null) {
          return;
        }
        dateTime = value;
        birthDay = '${dateTime.year}/${dateTime.month}/${dateTime.day}';
      });
    });
  }

  Widget buildDatePicker() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Birthday',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: TextEditingController(
                text: '${dateTime.year}/${dateTime.month}/${dateTime.day}'),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: _showDatePicker,
                  icon: const Icon(Icons.calendar_month)),
              suffixIconColor: const Color.fromARGB(194, 255, 255, 255),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(40, 255, 255, 255), width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(88, 255, 255, 255), width: 2)),
              filled: true,
              fillColor: const Color.fromARGB(18, 255, 255, 255),
            ),
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.datetime,
          ),
        ],
      );
}
