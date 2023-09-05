import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyx/components/email_text_field.dart';
import 'package:flyx/components/password_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confirmPasswordController.text ||
        emailController.text.isEmpty) {
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

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
            ),
            // const SizedBox(height: 50),
          ),
        ),
      ),
    );
  }
}
