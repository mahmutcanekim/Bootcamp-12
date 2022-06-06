import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:refika_app/pages/home_page.dart';
import 'package:refika_app/pages/login_page.dart';


class Service {
  //Bu servisle aut işlerini yapacağz
  final auth = FirebaseAuth.instance;

// kullanıcı yaratma fonksiyonu

  void createUser(context, email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ))
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

//oturum açma fonksiyonu
  void loginUser(context, email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()))
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

//çıkış fonksiyonu
  void signOut(context) async {
    try {
      await auth.signOut().then((value) => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            )
          });
    } catch (e) {
      errorBox(context, e);
    }
  }

//hata gösterme fonksiyonu
  void errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: const Text("Error"), content: Text(e.toString()));
        });
  }
}
