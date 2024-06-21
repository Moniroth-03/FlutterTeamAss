import 'package:flutter/material.dart';

class LastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.greenAccent,
              padding: EdgeInsets.only(top: 30.0, bottom: 20.0,),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.settings, color: Colors.black),
                        onPressed: () {
                          // Handle settings press
                        },
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSaWrCwYqgtGbUaGgyYzmsPonCfpdYRYOt6uIyNZZTLiVZFJ772',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ariaimadaria',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '@ariaimdaria',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildFollowInfo('11 Following'),
                      SizedBox(width: 20),
                      _buildFollowInfo('200K Followers'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Tap here to add description about yourself...',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Join since 2021',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Recently',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRecentItem(
                        'Marriage trial',
                        'by biyaoaeiou',
                        'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSaWrCwYqgtGbUaGgyYzmsPonCfpdYRYOt6uIyNZZTLiVZFJ772',
                      ),
                      _buildRecentItem(
                        'Fake or not',
                        'by binnie_',
                        'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSaWrCwYqgtGbUaGgyYzmsPonCfpdYRYOt6uIyNZZTLiVZFJ772',
                      ),
                      _buildRecentItem(
                        'Dr Jung',
                        'by peachandpeony',
                        'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSaWrCwYqgtGbUaGgyYzmsPonCfpdYRYOt6uIyNZZTLiVZFJ772',
                      ),
                    ],
                  ),
                ],
              ),
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
        currentIndex: 3, // This is the profile screen, so the profile icon is selected by default
        selectedItemColor: Color(0xFF00D6A3),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          // Handle bottom navigation tap
          if (index == 0) {
            // Navigate to home screen
          } else if (index == 1) {
            // Navigate to library screen
          } else if (index == 2) {
            // Navigate to edit screen
          } else if (index == 3) {
            // Stay on the current screen
          }
        },
      ),
    );
  }

  Widget _buildFollowInfo(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildRecentItem(String title, String subtitle, String imageUrl) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(color: Colors.black, fontSize: 16)),
        Text(subtitle,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ],
    );
  }
}