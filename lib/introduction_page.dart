import 'package:flutter/material.dart';
import 'package:refika_app/introduction_community.dart';

class IndroductionPage extends StatefulWidget {
  const IndroductionPage({Key? key}) : super(key: key);

  @override
  _IndroductionPageState createState() => _IndroductionPageState();
}

class _IndroductionPageState extends State<IndroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(224, 230, 99, 99),
      appBar: AppBar(
          title: const Text(
            'refikA',
          ),
          titleTextStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 25,
          ),
          backgroundColor: const Color.fromARGB(224, 230, 99, 99),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_circle_right_outlined),
              iconSize: 35,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CommunityPage()));
              },
            )
          ]),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 7.0, bottom: 100),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/refika_logo.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
