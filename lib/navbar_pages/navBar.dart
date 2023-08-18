import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flyx/navbar_pages/book.dart';
import 'package:flyx/navbar_pages/chat.dart';
import 'package:flyx/navbar_pages/explore.dart';
import 'package:flyx/navbar_pages/home.dart';
import 'package:flyx/navbar_pages/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 1;
  final screens = [
    const Home(),
    const Chat(),
    const Book(),
    const Explore(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: screens[index],
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )),
          child: NavigationBar(
              backgroundColor: const Color.fromARGB(255, 17, 17, 17),
              indicatorColor: Colors.transparent,
              elevation: 40,
              height: 80,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: "Home"),
                NavigationDestination(
                    icon: Icon(Icons.chat_bubble_outline),
                    selectedIcon: Icon(Icons.chat_bubble),
                    label: "Chat"),
                NavigationDestination(
                    icon: Icon(Icons.rocket_outlined),
                    selectedIcon: Icon(Icons.rocket),
                    label: "Book"),
                NavigationDestination(
                    icon: Icon(Icons.explore_outlined),
                    selectedIcon: Icon(Icons.explore),
                    label: "Explore"),
                NavigationDestination(
                    icon: Icon(Icons.account_circle_outlined),
                    selectedIcon: Icon(Icons.account_circle),
                    label: "Account"),
              ]),
        ),
      ),
    );
  }
}
