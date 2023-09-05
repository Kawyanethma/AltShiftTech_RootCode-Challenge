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
  final GlobalKey<FormState> _loginform1 = GlobalKey<FormState>();
  final email = TextEditingController();

  final password = TextEditingController();

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
      if (e.code == 'user-not-found') {
        showTextSnackBar(context, 'No user found');
      } else if (e.code == 'wrong-password') {
        showTextSnackBar(context, 'Wrong password');
      }
      print(e);
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
            child: Form(
              key: _loginform1,
              child: Column(
                children: [
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
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(children: [
                      Column(children: [
                        EmailTextField(
                            controller: email,
                            hintText: "test@test.com",
                            title: "Email"),
                        const SizedBox(
                          height: 10,
                        ),
                        PasswordTextField(
                            controller: password,
                            hintText: "Enter your password",
                            title: "Password"),
                        const SizedBox(
                          height: 10,
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
                                if (_loginform1.currentState!.validate()) {
                                  signIn();
                                }
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
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
                            height: 40,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupMain()),
                                    (route) => route.isFirst);
                              },
                              child: Text(
                                'Create new Accout',
                                style: GoogleFonts.lato(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 242, 184, 32)),
                                textAlign: TextAlign.center,
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.buttonText,
  });

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: const Color.fromARGB(255, 49, 100, 221),
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            buttonText,
            style: GoogleFonts.lato(
                fontSize: 23, fontWeight: FontWeight.w400, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  });

  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
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
            hintText: hint,
            hintStyle:
                const TextStyle(color: Color.fromARGB(114, 255, 255, 255))),
        keyboardType: inputType,
        textInputAction: inputAction,
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.hint,
    required this.inputAction,
  });

  final String hint;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
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
            hintText: hint,
            hintStyle:
                const TextStyle(color: Color.fromARGB(114, 255, 255, 255))),
        obscureText: true,
        textInputAction: inputAction,
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

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
