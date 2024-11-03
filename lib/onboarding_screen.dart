import 'package:flutter/material.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  final List<Widget> pages = [
    const OnboardingPage(
      image: 'assets/first.png',
      title: 'Quality',
      description:
      'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.',
      buttonColor: Colors.green,
      pn: 0,
    ),
    const OnboardingPage(
      image: 'assets/second.png',
      title: 'Convenient',
      description:
      'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
      buttonColor: Colors.orange,
      pn: 1,
    ),
    const OnboardingPage(
      image: 'assets/third.png',
      title: 'Local',
      description:
      'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.',
      buttonColor: Colors.yellow,
      pn: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: pages,
      ),
    );
  }
}