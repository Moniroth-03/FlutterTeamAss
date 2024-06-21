import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_team_assignment/third_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           RichText(
            text: const
             TextSpan(
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
                labelText: 'Enter your Username',
                border: OutlineInputBorder(),
              ),
            ),
             const SizedBox(height: 24.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your Email',
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
            const SizedBox(height: 16.0),
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
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
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00D6A3), // Button color
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );

  }
}