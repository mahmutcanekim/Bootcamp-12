import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:refika_app/register_page.dart';
import 'package:refika_app/service/google_sign_in.dart';
import 'package:refika_app/singin_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMe = false;

  Widget googleSignIn() {
    return SizedBox(
      height: 50,
      width: 50,
      child: RawMaterialButton(
        elevation: 2.0,
        fillColor: Colors.white,
        child: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.red.shade900,
          size: 35.0,
        ),
        padding: const EdgeInsets.all(5.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        onPressed: () async {
          var data = await GoogleSignHelper.instance.signIn();
          if (data != null) {
            var userData = await GoogleSignHelper.instance.firebaseSignin();
          }
        },
      ),
    );
  }

  Widget facebookSignIn() {
    return SizedBox(
      height: 50,
      width: 50,
      child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.white,
          child: const FaIcon(
            FontAwesomeIcons.facebook,
            color: Colors.blue,
            size: 35.0,
          ),
          padding: const EdgeInsets.all(5.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)))),
    );
  }

  Widget instagramSignIn() {
    return SizedBox(
      height: 50,
      width: 50,
      child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.white,
          child: FaIcon(
            FontAwesomeIcons.instagram,
            color: Colors.pink.shade400,
            size: 35.0,
          ),
          padding: const EdgeInsets.all(5.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)))),
    );
  }

  Widget buildLoginBtn() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.white,
            elevation: 5,
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SigninPage()));
        },
        child: const Text(
          'LOGIN',
          style: TextStyle(
              color: Color(0xff5ac18e),
              fontSize: 18,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  Widget buildQuestBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      },
      child: RichText(
          text: const TextSpan(children: [
        TextSpan(
            text: ' Continue as guest',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900))
      ])),
    );
  }

  Widget buildCreateBtn() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.white,
            elevation: 5,
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterPage()));
        },
        child: const Text(
          'CREATE ACCOUNT',
          style: TextStyle(
              color: Color.fromARGB(248, 255, 130, 5),
              fontSize: 18,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        resizeToAvoidBottomInset: false,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/login_page.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 200),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        googleSignIn(),
                        facebookSignIn(),
                        instagramSignIn(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    buildLoginBtn(),
                    const SizedBox(height: 20),
                    buildCreateBtn(),
                    const SizedBox(height: 20),
                    buildQuestBtn(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
