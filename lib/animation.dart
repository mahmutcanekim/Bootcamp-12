import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'introduction_onboarding.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
            splash: Image.asset('assets/images/refika_logo.png'),
            nextScreen: const CommunityPage(),
            splashTransition: SplashTransition.rotationTransition,
            splashIconSize: 500,
            backgroundColor: Colors.white),
      ),
    );
  }
}
