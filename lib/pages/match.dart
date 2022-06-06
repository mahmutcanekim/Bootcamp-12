import 'package:flutter/material.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Match ",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: const Color(0xffF66EB4),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/match_match.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
