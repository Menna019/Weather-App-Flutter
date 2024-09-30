import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.image, required this.description});
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Image.asset(image),
      Text(description,
      style:const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      ),
      textAlign: TextAlign.center,
      ),
      ],
      ),
    );
  }
}