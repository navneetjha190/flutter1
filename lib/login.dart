import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ne/s1.dart';
import 'dart:convert';


import 'Otp.dart';
import 'forgot.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Prepare the HTTP request body
      final Map<String, dynamic> requestBody = {
        'email': _email,
        'password': _password,
        'role': 'farmer',
        'device_token': '0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx', // replace with your actual device token
        'type': 'email',
        'social_id': '0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx', // replace with your actual social_id if needed
      };

      // Send the HTTP POST request
      final response = await http.post(
        Uri.parse('https://sowlab.com/assignment/user/login'), // replace with your actual API endpoint
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      // Handle the response
      if (response.statusCode == 200) {
        // Handle successful login
        final data = json.decode(response.body);
        print('Login successful: $data');
        Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtpPage()),
        );
      } else {
        // Handle login failure
        print('Login failed: ${response.statusCode}');
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Transform.translate(
                  offset: Offset(-130,-120),
                  child: Text(
                      'FarmerEats',
                      style: TextStyle(fontSize: 18)
                    ),
                ),


              Transform.translate(
                offset: Offset(-75,-80),
                child: Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Transform.translate(
                offset: Offset(-90,-80),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text('New here? Create account',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  filled:true,
                  fillColor: Colors.grey[100],
                  labelText: 'Email Address',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration( suffixIcon: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Forgot?",
                      style: TextStyle(
                        color: Colors.red[900],
                      ),
                    ),
                  ),
                ),
                  filled:true,
                  fillColor: Colors.grey[100],
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor:Colors.red[900],
                  foregroundColor:Colors.white,
                  textStyle:TextStyle(fontSize:18)
                ),
              ),
              SizedBox(height: 30),
              Text(
                'or login with',
                style: TextStyle(fontSize:11)
              ),
              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/google.png'),
                    onPressed: () {

                      // Implement Google login
                    },
                  ),
                  SizedBox(width: 40.0),
                  IconButton(
                    icon: Image.asset('assets/apple.png'),
                    onPressed: () {
                      // Implement Apple login
                    },
                  ),
                  SizedBox(width: 40.0),
                  IconButton(
                    icon: Image.asset('assets/facebook.png'),
                    onPressed: () {


                      // Implement Facebook login
                    },
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}