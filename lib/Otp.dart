import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'forgot2.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);



  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final List<TextEditingController> _otpControllers =
  List.generate(6, (index) => TextEditingController());

  String _message = '';

  // Function to get the full OTP
  String getFullOtp() {
    return _otpControllers.map((controller) => controller.text).join();
  }

  // Function to verify OTP
  Future<void> _verifyOtp() async {
    final String otp = getFullOtp().trim();


    print(otp);
    if (otp.isEmpty) {
      setState(() {
        _message = 'OTP cannot be empty.';
      });
      return;
    }

    final url = Uri.parse('https://sowlab.com/assignment/user/verify-otp');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'otp': otp}),
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      setState(() {
        if (response.statusCode == 200) {
          _message = 'OTP verified successfully. Token: ${responseData['token']}';
        }
        else if(response.statusCode == 401){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordPage()),
        );
        }
        else {
          _message = responseData['message'];
        }
      });
    } catch (e) {
      setState(() {
        _message = 'Unable to verify OTP, please try again.';
      });
    }
    print(_message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.translate(
              offset: Offset(-130,-120),
              child: Text(
                  'FarmerEats',
                  style: TextStyle(fontSize: 18)
              ),
            ),
            const SizedBox(height: 50),
            Transform.translate(
              offset: Offset(-116,-110),
              child: const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Transform.translate(
              offset:Offset(-55,-110),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Remember your password?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to the login page
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) => _buildOtpField(context,_otpControllers[index])),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed:
              _verifyOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
                padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Handle resend code logic here
              },
              child: const Text(
                'Resend Code',
                style: TextStyle(fontSize: 16,
                    color: Colors.transparent,
                    shadows: [Shadow(color: Colors.black, offset: Offset(0, -2))],
                    decoration: TextDecoration.underline,
                    decorationThickness: 2.5,
                    decorationColor: Colors.black


                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context,TextEditingController controller) {
    return SizedBox(
      width: 40,
      child: TextFormField(
        controller: controller,

        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
          counterText: '',
        ),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
