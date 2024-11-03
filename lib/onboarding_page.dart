import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ne/login.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Color buttonColor;
  final int pn;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.buttonColor,
    required this.pn,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: buttonColor,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 60.0)),

            Container(
              height: 320,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)
                  )
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 19.0)),

                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 1),
              Text(

                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
                  Padding(padding: EdgeInsets.only(bottom: 40.0)),

                  new DotsIndicator(
          dotsCount: 3,
          position: pn,
          decorator: DotsDecorator(
            color: Colors.black,
            activeColor: Colors.black,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
                  Padding(padding: EdgeInsets.only(bottom: 15.0)),

                  ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text(
                  'Join the movement!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(

                    color: Colors.transparent,
                    shadows: [Shadow(color: Colors.black, offset: Offset(0, -3))],
                    decoration: TextDecoration.underline,
                    decorationThickness: 2.5,
                    decorationColor: Colors.black

                  ),
                ),
              ),
              SizedBox(height: 20),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}