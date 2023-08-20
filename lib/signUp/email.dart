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
      showTextSnackBar(context, "Please check details");

      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      showTextSnackBar(context, e.code);
    }
  }

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
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      DotStepper(
                        activeStep: 0,
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
                            showTextSnackBar(context, "Please check details");
                            // signUp();
                            // FirebaseAuth.instance
                            //     .idTokenChanges()
                            //     .listen((User? user) {
                            //   if (user == null) {
                            //     print('User is currently signed out!');
                            //   } else {
                            //     print('User is signed in!');
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               const PersonalDetails()),
                            //     );
                            //   }
                            // });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Next',
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
            // const SizedBox(height: 50),
          ),
        ),
      ),
    );
  }

  void showTextSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          const SizedBox(
            width: 25,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
