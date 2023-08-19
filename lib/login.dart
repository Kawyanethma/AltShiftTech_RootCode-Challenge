import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 200,
                width: 10,
              ),
              Image.asset("images/logo.png", width: 150),
              const SizedBox(height: 15),
              const SizedBox(
                height: 150,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Column(children: [
                      TextInput(
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      PasswordInput(
                        hint: 'Password',
                        inputAction: TextInputAction.done,
                      ),
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
                    Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Button(buttonText: 'Login'),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: Colors.white, width: 1),
                          )),
                          child: Text(
                            'Create New Account',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
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

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.buttonText,
  });

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
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
