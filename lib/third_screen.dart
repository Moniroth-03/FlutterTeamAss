import 'package:flutter/material.dart';
import 'package:flutter_team_assignment/fourth_screen.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color from the image
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 48.0, // Adjust size as needed
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Read',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'ify',
                    style: TextStyle(
                        color: Color(0xFF00D6A3)), // Adjust color as needed
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Your favorite stories are here',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your Email or username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Enter your password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourthScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00D6A3), // Button color
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Handle forgot password
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16.0),
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      color: Color(0xFF00D6A3), // Adjust color as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
