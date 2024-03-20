import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  const [
           Padding(padding: EdgeInsets.only(top: 25,left: 15),
             child: Text("Bookings",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
       )
        ],
      ),
    );
  }
}
