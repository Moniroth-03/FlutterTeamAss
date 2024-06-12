import 'package:flutter/material.dart';
import 'package:flutter_team_assignment/third_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF00D6A3), // Background color from the image
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThirdScreen()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'សូមជ្រើសរើសភាសា!',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              const Text(
                'Please choose a language!',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              const SizedBox(height: 32.0),
              LanguageTile(
                flagUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_Cambodia.svg/640px-Flag_of_Cambodia.svg.png',
                language: 'ភាសាខ្មែរ',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                ),
              ),
              const SizedBox(height: 8.0),
              LanguageTile(
                flagUrl:
                    'https://cdn.britannica.com/25/4825-004-F1975B92/Flag-United-Kingdom.jpg',
                language: 'English',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  final String flagUrl;
  final String language;
  final VoidCallback onTap;

  const LanguageTile({
    required this.flagUrl,
    required this.language,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Image.network(
          flagUrl,
          width: 32.0,
          height: 32.0,
        ),
        title: Text(language),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
