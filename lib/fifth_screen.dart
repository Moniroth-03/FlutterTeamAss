import 'package:flutter/material.dart';
import 'package:flutter_team_assignment/fourth_screen.dart';
import 'package:flutter_team_assignment/last_screen.dart';

class FifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0), // Add top padding here
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Read',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'ify',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '@ariaimdaria',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSaWrCwYqgtGbUaGgyYzmsPonCfpdYRYOt6uIyNZZTLiVZFJ772'), // Replace with actual profile image URL
                        radius: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildStoryCard(
              'Dear J',
              '0 of 1 part published',
              'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSaWrCwYqgtGbUaGgyYzmsPonCfpdYRYOt6uIyNZZTLiVZFJ772', // Replace with actual image URL
            ),
            SizedBox(height: 10),
            _buildStoryCard(
              'Horizon',
              '0 of 1 part published',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx2b-sJu7egaLVxlg4_8VszwNqbGBI0KX972tezJ-B8ur2-XYV', // Replace with actual image URL
            ),
            SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {
                // Handle edit another story
              },
              icon: Icon(Icons.edit, color: Colors.black),
              label: Text('Edit another story',
                  style: TextStyle(color: Colors.black)),
            ),
            TextButton.icon(
              onPressed: () {
                // Handle create a new story
              },
              icon: Icon(Icons.add, color: Colors.black),
              label: Text('Create a new story',
                  style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex:
            2, // This is the "Write" screen, so the edit icon is selected by default
        selectedItemColor: Color(0xFF00D6A3),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          // Handle bottom navigation tap
          if (index == 0) {
            // Navigate to home screen
          } else if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FourthScreen(),
                ));
            // Navigate to bar chart screen
          } else if (index == 2) {
            // Stay on the current screen
          } else if (index == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LastScreen(),
                ));
            // Navigate to profile screen
          }
        },
      ),
    );
  }

  Widget _buildStoryCard(String title, String subtitle, String imageUrl) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 120,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8.0), // Added space between image and text
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Continues writing',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: 4.0), // Added space between text elements
                      Text(
                        title,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                          height: 4.0), // Added space between text elements
                      Text(subtitle, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
