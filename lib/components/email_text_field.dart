import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String title;

  const EmailTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 8),
        TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email should not be empty';
              }
              if (!isValidEmail(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
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
                hintText: hintText,
                hintStyle:
                    const TextStyle(color: Color.fromARGB(114, 255, 255, 255))),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next),
      ],
    );
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }
}
