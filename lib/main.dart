import 'package:flutter/material.dart';
import 'package:plant/ui/onboarding_screen.dart';

void main() {
  runApp( MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp (
      title: 'onboarding Screen',
      home: onboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}



