import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';

import '../components/address_text_field.dart';
import '../components/email_text_field.dart';
import '../components/name_text_field.dart';
import '../components/passport_text_field.dart';
import '../components/password_field.dart';
import '../components/phone_text_field.dart';

class SignupMain extends StatefulWidget {
  const SignupMain({super.key});

  @override
  State<SignupMain> createState() => _SignupMainState();
}

class _SignupMainState extends State<SignupMain> {
  final GlobalKey<FormState> _form1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _form2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _form3 = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passportNumber = TextEditingController();
  final phoneNumber = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late String birthDay;
  DateTime dateTime = DateTime.now();
  final addressController = TextEditingController();
  String? dropdownvalue1;
  String? dropdownvalue2;

  // List of items in dropdown menu
  var itemsP = [
    'Earth',
    'Mars',
    'Venus',
    'Mercury',
  ];
  var itemsC = [
    'New York,',
    'London',
    'Paris',
    'San Francisco',
    'Colombo',
  ];
  String title = 'Next';
  int activeIndex = 0;
  int totalPages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 35,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 27,
          ),
          onPressed: () {
            setState(() {
              if (activeIndex == 0) {
                Navigator.of(context).pop();
              } else {
                activeIndex--;
                if (activeIndex != 2) {
                  title = "Next";
                }
              }
            });
          },
        ),
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DotStepper(
              activeStep: activeIndex,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MaterialButton(
                  color: const Color.fromARGB(255, 49, 100, 221),
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  onPressed: () {
                    setState(() {
                      if (activeIndex == 2) {
                        signup();
                        FirebaseAuth.instance
                            .idTokenChanges()
                            .listen((User? user) {
                          if (user == null) {
                            print('User is currently signed out!');
                          } else {
                            print('User is signed in!');
                            // Navigator.of(context).pushAndRemoveUntil(
                            //     MaterialPageRoute(
                            //         builder: (context) => const NavBar()),
                            //     (route) => route.isFirst);
                          }
                        });
                      } else {
                        title = "Next";
                        switch (activeIndex) {
                          case 0:
                            if (firstNameController.text.isEmpty ||
                                lastNameController.text.isEmpty ||
                                passportNumber.text.isEmpty ||
                                phoneNumber.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Fill all the field.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              activeIndex++;
                            }
                            break;
                          case 1:
                            if ((emailController.text.isEmpty ||
                                    passwordController.text.isEmpty) ||
                                (!_form2.currentState!.validate())) {
                              Fluttertoast.showToast(
                                  msg: "Fill all the field.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              activeIndex++;
                            }
                            break;
                          default:
                        }
                        if (activeIndex == 2) {
                          title = "Finish";
                        }
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      title,
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
            )
          ],
        ),
      ),
      body: bodyBulider(),
    );
  }

  Widget bodyBulider() {
    switch (activeIndex) {
      case 0:
        return buildPeronsal();
      case 1:
        return buildEmail();
      case 2:
        return buildAddress();
      default:
        return buildPeronsal();
    }
  }

  void signup() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then(
        (value) {
          print(passportNumber.text);
          addUserToFirebase(
              address:
                  addressController.text + dropdownvalue1! + dropdownvalue1!,
              birthDay: birthDay,
              email: emailController.text,
              mobileNumber: phoneNumber.text,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              passportNumber: passportNumber.text);
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: "The password is too weak.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "Email already in use.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget buildAddress() {
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
              child: Form(
                key: _form3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 100,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Personal Address',
                        style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      AddressTextField(
                        controller: addressController,
                        hintText: '1234 NW Bobcat Lane, St. Robert',
                        title: 'Address',
                      ),
                      const SizedBox(height: 15),
                      buildCountryDropButton(),
                      const SizedBox(height: 15),
                      buildPlanetDropButton(),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCountryDropButton() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Country',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField(
              menuMaxHeight: 250,
              icon: const Icon(Icons.keyboard_arrow_down),
              iconEnabledColor: Colors.white,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(40, 255, 255, 255), width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(88, 255, 255, 255), width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(88, 255, 255, 255), width: 2)),
                filled: true,
                fillColor: const Color.fromARGB(18, 255, 255, 255),
              ),
              validator: (value) => value == null ? "Select a country" : null,
              dropdownColor: const Color.fromARGB(209, 0, 0, 0),
              value: dropdownvalue1,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue1 = newValue!;
                });
              },
              items: itemsC.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList()),
        ],
      );

  Widget buildPlanetDropButton() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Planet',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField(
              menuMaxHeight: 250,
              icon: const Icon(Icons.keyboard_arrow_down),
              iconEnabledColor: Colors.white,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(40, 255, 255, 255), width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(88, 255, 255, 255), width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(88, 255, 255, 255), width: 2)),
                filled: true,
                fillColor: const Color.fromARGB(18, 255, 255, 255),
              ),
              validator: (value) => value == null ? "Select a country" : null,
              dropdownColor: const Color.fromARGB(209, 0, 0, 0),
              value: dropdownvalue2,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue2 = newValue!;
                });
              },
              items: itemsP.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList()),
        ],
      );

  Widget buildPeronsal() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
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
              child: Form(
                key: _form1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                      size: 90,
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
                    const SizedBox(height: 15),
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
                  ],
                ),
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

  Widget buildEmail() {
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
              child: Form(
                key: _form2,
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
                    const Text(
                      'Confirm Password',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password should not be empty';
                          }
                          if (value != passwordController.text) {
                            return 'Not Match with password';
                          }
                          if (value.length < 6) {
                            return 'Password should be at least 6 characters';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(40, 255, 255, 255),
                                    width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(88, 255, 255, 255),
                                    width: 2)),
                            filled: true,
                            fillColor: const Color.fromARGB(18, 255, 255, 255),
                            hintText: 'confirm password',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(114, 255, 255, 255))),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        textInputAction: TextInputAction.next),
                  ],
                ),
              ),
            ),
            // const SizedBox(height: 50),
          ),
        ),
      ),
    );
  }

//this function is adding to user details to firebase
  Future addUserToFirebase(
      {required String address,
      required String birthDay,
      required String email,
      required String mobileNumber,
      required String firstName,
      required String lastName,
      required String passportNumber}) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc(email);

    final json = {
      'booked': false,
      'First Name': firstName,
      'Last Name': lastName,
      'phone number': mobileNumber,
      'email': email,
      'passport number': passportNumber,
      'birthday': birthDay,
      'address': address,
    };
    await docUser.set(json);
  }
}
