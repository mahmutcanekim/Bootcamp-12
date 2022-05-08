import 'package:flutter/material.dart';
import 'package:refika_app/introduction_activities.dart';



class IntroMatchesPage extends StatefulWidget {
  const IntroMatchesPage({Key? key}) : super(key: key);

  @override
  _IntroMatchesPageState createState() => _IntroMatchesPageState();
}

class _IntroMatchesPageState extends State<IntroMatchesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        builder: (context) => const IntroActivitiesPage()));
              },
            )
          ]),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/custom_matches.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
