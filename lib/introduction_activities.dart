import 'package:flutter/material.dart';
import 'package:refika_app/login_page.dart';


class IntroActivitiesPage extends StatefulWidget {
  const IntroActivitiesPage({Key? key}) : super(key: key);

  @override
  _IntroActivitiesPageState createState() => _IntroActivitiesPageState();
}

class _IntroActivitiesPageState extends State<IntroActivitiesPage> {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            )
          ]),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/activities.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
