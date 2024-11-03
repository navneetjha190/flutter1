import 'package:flutter/material.dart';

class FarmInfoScreen extends StatelessWidget {

  FarmInfoScreen();

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _informalNameController = TextEditingController();
  final TextEditingController _streetAddressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _businessNameController,
              decoration: InputDecoration(labelText: 'Business Name'),
            ),
            TextField(
              controller: _informalNameController,
              decoration: InputDecoration(labelText: 'Informal Name'),
            ),
            TextField(
              controller: _streetAddressController,
              decoration: InputDecoration(labelText: 'Street Address'),
            ),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: _stateController,
              decoration: InputDecoration(labelText: 'State'),
            ),
            TextField(
              controller: _zipCodeController,
              decoration: InputDecoration(labelText: 'Zip Code'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Validate input and proceed

              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}