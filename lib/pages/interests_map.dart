import 'package:flutter/material.dart';

class InterestPage extends StatelessWidget {
  const InterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Interest Map ",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: const Color(0xffF66EB4),
        centerTitle: true,
      ),
    );
  }
}