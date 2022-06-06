import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Location Map ",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: const Color(0xffF66EB4),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/map.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
