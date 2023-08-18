import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Book',
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}