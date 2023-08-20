import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyx/auth/auth.dart';
import 'package:flyx/components/email_text_field.dart';
import 'package:flyx/components/password_field.dart';
import 'package:flyx/signUp/signup_main.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  void signIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      if (context.mounted) {
        Navigator.pop(context);
      }
    } on FirebaseException catch (e) {
      showTextSnackBar(context, e.code);
      Navigator.pop(context);
    }
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
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
          body: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 100,
                width: 10,
              ),
              Image.asset("images/logo.png", width: 150),
              const SizedBox(height: 15),
              const SizedBox(
                height: 150,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Column(children: [
                      EmailTextField(
                          controller: email,
                          hintText: 'abc@abc.com',
                          title: 'Email'),
                      const SizedBox(
                        height: 15,
                      ),
                      PasswordTextField(
                          controller: password,
                          hintText: 'password',
                          title: 'Password'),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
                    Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            color: const Color.fromARGB(255, 49, 100, 221),
                            minWidth: double.infinity,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            onPressed: () {
                              signIn();
                              FirebaseAuth.instance
                                  .idTokenChanges()
                                  .listen((User? user) {
                                if (user == null) {
                                  print('User is currently signed out!');
                                } else {
                                  print('User is signed in!');
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AuthPage()),
                                      (route) => route.isFirst);
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                "LogIn",
                                style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const SignupMain()),
                                  (route) => route.isFirst);
                            },
                            child: Text(
                              'Create new Accout',
                              style: GoogleFonts.lato(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      const Color.fromARGB(255, 242, 184, 32)),
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        )
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/Signup_img_1.png'),
        fit: BoxFit.cover,
      )),
    );
  }
}
