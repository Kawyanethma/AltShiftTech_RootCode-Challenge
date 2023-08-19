import 'package:flutter/material.dart';
import 'package:flyx/navbar_pages/nav_bar.dart';
import 'package:flyx/signUp/address.dart';
import 'package:flyx/signUp/email.dart';
import 'package:flyx/signUp/personal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';

class SignupMain extends StatefulWidget {
  const SignupMain({super.key});

  @override
  State<SignupMain> createState() => _SignupMainState();
}

class _SignupMainState extends State<SignupMain> {
  String title = 'Next';
  int activeIndex = 0;
  int toalPages = 3;

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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
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
                      print(activeIndex);
                      if (activeIndex == 2) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => NavBar()),
                            (route) => false);
                      } else {
                        title = "Next";
                        activeIndex++;
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
        return const PersonalDetails();
      case 1:
        return const Email();
      case 2:
        return const Address();
      default:
        return const PersonalDetails();
    }
  }
}
