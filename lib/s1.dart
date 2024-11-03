import 'package:flutter/material.dart';
import 'package:ne/s2.dart';

import 'login.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

      body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 130), // Adjusted to give space at the top

              Transform.translate(
                offset: Offset(-5,-100),
                child: Text(
                    'FarmerEats',
                    style: TextStyle(fontSize: 18)
                ),
              ),
              Transform.translate(
                  offset: Offset(-5,-80),
                  child: Text("Signup 1 of 4", style: TextStyle(fontSize: 14,color:Colors.grey))
        
              ),
              Transform.translate(
                  offset: Offset(-5,-60),
                  child: Text("Welcome!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Image.asset('assets/google.png'), onPressed: () {}),
                  SizedBox(width: 40),
        
                  IconButton(icon: Image.asset('assets/apple.png'), onPressed: () {}),
                  SizedBox(width: 40),
        
                  IconButton(icon: Image.asset('assets/facebook.png'), onPressed: () {}),
                ],
              ),
              SizedBox(height: 5),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(decoration: InputDecoration(labelText: 'Full Name',
                      filled:true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),
                        borderSide: BorderSide.none,
                      ),
                    )),
                    SizedBox(height:10),
        
                    TextFormField(decoration: InputDecoration(labelText: 'Email Address',
                      filled:true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),
                        borderSide: BorderSide.none,
                      ),)),
                    SizedBox(height:10),

                    TextFormField(decoration: InputDecoration(labelText: 'Phone Number',
                      filled:true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),
                        borderSide: BorderSide.none,
                      ),)),
                    SizedBox(height:10),

                    TextFormField(decoration: InputDecoration(labelText: 'Password',
                      filled:true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),
                        borderSide: BorderSide.none,
                      ),
                    )),
                    SizedBox(height:10),

                    TextFormField(decoration: InputDecoration(labelText: 'Re-enter Password',
                      filled:true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),
                        borderSide: BorderSide.none,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(height:40),
              Row(
                children:[
                  SizedBox(width: 10),
        
        
        
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
                  SizedBox(width: 70),
        
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 210.0),
                    child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FarmInfoScreen()),
                      );
                    },
                    child: Text('Continue'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.red[900],
        
                        foregroundColor:Colors.white,
                        textStyle:TextStyle(fontSize:14)
                    ),
                                  ),
                  ),
        
        ]
              ),
            ],
          ),
        ),

    );
  }
}
