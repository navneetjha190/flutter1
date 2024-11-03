import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  final Function onNext;
  final Function(String) onFilePicked;

  VerificationScreen({required this.onNext, required this.onFilePicked});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Attach proof of registration'),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () async {
                // Trigger file picker or camera to pick an image
                String filePath = await pickFile();  // Implement this function
                onFilePicked(filePath);
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Validate input and proceed
                onNext();
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> pickFile() async {
    // Implement file picking functionality
    return "path/to/selected/file";
  }
}