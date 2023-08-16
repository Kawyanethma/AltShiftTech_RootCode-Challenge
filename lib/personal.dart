import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final firstNameController = TextEditingController();

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
                  image: AssetImage("images/Signup_img_1.png"),
                  fit: BoxFit.cover)),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 25),
                const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 120,
                ),
                const SizedBox(height: 20),
                Text(
                  'Personal Details',
                  style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 25),
                buildFirstName(),
                const SizedBox(height: 15),
                buildFirstName(),
                const SizedBox(height: 15),
                buildFirstName(),
                const SizedBox(height: 15),
                buildFirstName(),
              ],
            ),
          ),
        ),
      ),
    );
  }

//text field for first Name
  Widget buildFirstName() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'First Name',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: firstNameController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
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
                hintText: 'John',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(114, 255, 255, 255))),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
          ),
        ],
      );
}
