import 'package:flutter/material.dart';
import 'package:refika_app/pages/chat_screen.dart';
import 'package:refika_app/pages/interests_map.dart';
import 'package:refika_app/pages/location_map.dart';
import 'package:refika_app/pages/login_page.dart';
import 'package:refika_app/pages/match.dart';
import 'package:refika_app/service/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "refikA",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: const Color(0xffF66EB4),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(
              "Mahmutcan Ekim",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
            ),
            accountEmail: Text(
              "mahmut_1475@hotmail.com",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.kindpng.com/picc/m/21-214648_profile-man-male-photo-face-portrait-illustration-kik.png"),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffF66EB4),
                Color(0xffFEB665),
              ]),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text("Profil"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: const Text("Favorites"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none),
            title: const Text("Notifications"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text("Privacy"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_center_outlined),
            title: const Text("Help Center"),
            onTap: () {},
          ),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Sign Out"),
              onTap: () async {
                await GoogleSignHelper.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }),
        ]),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 180),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.all(23.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatScreen()));
                  },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Ink.image(
                          image: const AssetImage('assets/images/chat.png'),
                          height: 150,
                          width: 200,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  )),
            ),
            Card(
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.all(23.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MatchPage()));
                  },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Ink.image(
                          image: const AssetImage('assets/images/match.png'),
                          height: 150,
                          width: 200,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  )),
            ),
            Card(
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.all(23.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LocationPage()));
                  },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Ink.image(
                          image: const AssetImage(
                              'assets/images/location_map.png'),
                          height: 150,
                          width: 200,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  )),
            ),
            Card(
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.all(23.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InterestPage()));
                  },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Ink.image(
                          image: const AssetImage(
                              'assets/images/interest_map.png'),
                          height: 150,
                          width: 200,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/refika_logo_kucuk.png"),
                alignment: Alignment.topCenter,
                scale: 0.7),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFF559F),
                  Color(0xffCF5CCF),
                  Color(0xffFF57AC),
                  Color(0xffFF6D91),
                  Color(0xffFF57AC),
                  Color(0xffCF5CCF),
                ])),
      ),
    );
  }
}
