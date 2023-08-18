import 'package:flutter/material.dart';
import 'package:flyx/signUp/address.dart';
import 'package:flyx/components/email_text_field.dart';
import 'package:flyx/components/flyx_button_1.dart';
import 'package:flyx/components/password_field.dart';
import 'package:google_fonts/google_fonts.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                        Icons.email_outlined,
                        color: Colors.white,
                        size: 100,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Email & Password',
                        style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      EmailTextField(
                        controller: emailController,
                        hintText: 'Joe@example.com',
                        title: 'Email',
                      ),
                      const SizedBox(height: 15),
                      PasswordTextField(
                        controller: passwordController,
                        hintText: 'Enter new Passowrd',
                        title: 'Password',
                      ),
                      const SizedBox(height: 15),
                      PasswordTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm new Password',
                        title: 'Confirm Password',
                      ),
                    ],
                  ),
                  // const SizedBox(height: 50),
                  const Column(
                    children: [
                      FlyxButton1(title: 'Next', page: Address()),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
