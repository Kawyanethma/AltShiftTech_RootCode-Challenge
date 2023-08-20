import 'package:flutter/material.dart';
import 'package:flyx/signUp/signup_main.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password should be at least 8 characters';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      // Firebase logic
      // Firebase authentication code
      print('Logging in with Email: $email and Password: $password');
    }
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextInput(
                          hint: 'Email',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          controller: _emailController,
                          validator: _validateEmail,
                        ),
                        PasswordInput(
                          hint: 'Password',
                          inputAction: TextInputAction.done,
                          controller: _passwordController,
                          validator: _validatePassword,
                        ),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Button(buttonText: 'Login', onPressed: _login),
                        const SizedBox(
                          height: 50,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const SignupMain(),
                              ),
                              (route) => route.isFirst,
                            );
                          },
                          child: Text(
                            'Create new Account',
                            style: GoogleFonts.lato(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 242, 184, 32),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: const Color.fromARGB(255, 49, 100, 221),
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        onPressed: onPressed,
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
    Key? key,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controller;
  final String? Function(String?) validator; // Corrected type here

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color.fromARGB(40, 255, 255, 255),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color.fromARGB(88, 255, 255, 255),
              width: 2,
            ),
          ),
          filled: true,
          fillColor: const Color.fromARGB(18, 255, 255, 255),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color.fromARGB(114, 255, 255, 255),
          ),
        ),
        keyboardType: inputType,
        textInputAction: inputAction,
        controller: controller,
        validator: validator, // Use the provided validator function
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.hint,
    required this.inputAction,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final String hint;
  final TextInputAction inputAction;
  final TextEditingController controller;
  final String? Function(String?) validator; // Corrected type here

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color.fromARGB(40, 255, 255, 255),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color.fromARGB(88, 255, 255, 255),
              width: 2,
            ),
          ),
          filled: true,
          fillColor: const Color.fromARGB(18, 255, 255, 255),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color.fromARGB(114, 255, 255, 255),
          ),
        ),
        obscureText: true,
        textInputAction: inputAction,
        controller: controller,
        validator: validator, // Use the provided validator function
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
        ),
      ),
    );
  }
}
