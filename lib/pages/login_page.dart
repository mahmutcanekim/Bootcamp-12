import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:refika_app/pages/register_page.dart';
import 'package:refika_app/service/google_sign_in.dart';
import 'package:refika_app/pages/singin_page.dart';
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
      height: 60,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.red,
            elevation: 5,
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        icon: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.red.shade900,
        ),
        label: const Text(
          'SIGN UP WITH GOOGLE',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),
        ),
        onPressed: () async {
          var data = await GoogleSignHelper.instance.signIn();
          if (data != null) {
            var userData = await GoogleSignHelper.instance.firebaseSignin();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
        },
      ),
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
                    const SizedBox(height: 275),
                    googleSignIn(),
                    const SizedBox(height: 20),
                    buildLoginBtn(),
                    const SizedBox(height: 20),
                    buildCreateBtn(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}


