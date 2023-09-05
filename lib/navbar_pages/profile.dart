import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 80),
                UserTile(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                BlueBox(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(242, 242, 242, 0.2),
                        onPrimary: Colors.white,
                        minimumSize: const Size(120, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.wallet,
                              size: 30,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Wallet',
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(242, 242, 242, 0.2),
                        onPrimary: Colors.white,
                        minimumSize: const Size(120, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.history,
                              size: 30,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'History',
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(242, 242, 242, 0.2),
                        onPrimary: Colors.white,
                        minimumSize: const Size(120, 50), //  button size
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.logout,
                              size: 30,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Logout',
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 99, 219, 0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'DXB, Bridgehead, Pandora',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/Paralax overlay.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  double avatarRadius = 50.0; // Radius of the CircleAvatar

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: avatarRadius,
            backgroundImage: const AssetImage('images/demopic.jpg'),
            child: Container(
              width: avatarRadius * 2,
              height: avatarRadius * 2,
            ),
          ),
        ],
      ),
      title: const Text(
        'Ryan Comester',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      subtitle: const Text(
        'Colombo, Sri Lanka, Earth',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
