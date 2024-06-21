import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Readify'),
          bottom: const TabBar(
            indicatorColor: Colors.greenAccent,
            labelColor: Colors.greenAccent,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: 'Your reads'),
              Tab(text: 'Your Reading List'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            YourReadsView(),
            ReadingListView(), // Second tab content
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'true',
              ),
            ],
            currentIndex: 1,
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
            }),
      ),
    );
  }
}

class YourReadsView extends StatelessWidget {
  const YourReadsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Text(
                "Your offline reads",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.6,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookCard(book: books[index]);
            },
          ),
        ),
      ],
    );
  }
}

class ReadingListView extends StatelessWidget {
  const ReadingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: readingList.length,
      itemBuilder: (context, index) {
        return ReadingListCard(item: readingList[index]);
      },
    );
  }
}

class Book {
  final String title;
  final String author;
  final String imagePath;

  Book(this.title, this.author, this.imagePath);
}

class ReadingListItem {
  final String title;
  final String description;
  final String imagePath;
  final String storiesCount;

  ReadingListItem(
      this.title, this.description, this.imagePath, this.storiesCount);
}

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: double.infinity,
              child: Image.network(
                book.imagePath,
                fit: BoxFit.cover,
                height: 100.0,
                alignment: Alignment.center,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Error loading image'));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(book.author),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReadingListCard extends StatelessWidget {
  final ReadingListItem item;

  const ReadingListCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0), // Adjust padding as needed
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                item.imagePath,
                fit: BoxFit.cover,
                width: 100.0,
                height: 120.0,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Error loading image'));
                },
              ),
            ),
          ),

          SizedBox(width: 12.0), // Adds spacing between image and text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0), // Adjust padding as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    item.description,
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    item.storiesCount,
                    style: TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
            ),
          ),
          Icon(Icons.more_vert), // Moves the icon to the right side
        ],
      ),
    );
  }
}

final List<Book> books = [
  Book('Regret', 'Jeong Jaehyun',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/20231006_Jaehyun_%28NCT%29.jpg/800px-20231006_Jaehyun_%28NCT%29.jpg'),
  Book('Fortune\'s Fools', 'Jaehyun',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/2cc63c39-c53b-4b37-bf1f-a3a3810ad232/dg6sryj-b149d770-8b8d-4574-9486-cbfab74c68a7.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzJjYzYzYzM5LWM1M2ItNGIzNy1iZjFmLWEzYTM4MTBhZDIzMlwvZGc2c3J5ai1iMTQ5ZDc3MC04YjhkLTQ1NzQtOTQ4Ni1jYmZhYjc0YzY4YTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.31ZzB7D2ShEJuZF_-4o4m-c8IKfoZOu6ggcp9xa5aGg'),
  Book('My dear fanfics', 'Unknown',
      'https://cdn.pixabay.com/photo/2023/05/04/23/08/cat-7971239_1280.jpg'),
  Book('Regret', 'Jeong Jaehyun',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/babeecc8-aa18-45a0-bda8-35605c248eb5/dg50vtg-9c3d7c6b-859a-47c8-9d45-b21215b6ccaa.png/v1/fill/w_1280,h_1280,q_80,strp/white_cat_anime_style_by_spuko_dg50vtg-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTI4MCIsInBhdGgiOiJcL2ZcL2JhYmVlY2M4LWFhMTgtNDVhMC1iZGE4LTM1NjA1YzI0OGViNVwvZGc1MHZ0Zy05YzNkN2M2Yi04NTlhLTQ3YzgtOWQ0NS1iMjEyMTViNmNjYWEucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.C37zY8wDBDMCab6nBsOPGKvrG4lKGnL1h6xL-TXVCAc'),
  Book('Fortune\'s Fools', 'Jaehyun',
      'https://img.freepik.com/free-photo/side-view-anime-girl-hugging-cat_23-2150970943.jpg?t=st=1718155875~exp=1718159475~hmac=7b7b1d4b223ee26164351d2c0f8da44e78010642faa13dfd541abfec25aca8cf&w=1060'),
  Book('My dear fanfics', 'Unknown',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgq2m_BRuDp_3mMi7oS_7aU_nQBy7gJYWY5g&s'),
];

final List<ReadingListItem> readingList = [
  ReadingListItem(
    'My favorite hopeless romantic stories',
    'It\'s a deeply moving stories about young love and dealing with difficult circumstances.',
    'https://img.freepik.com/premium-vector/sketch-young-couple-love-line-art-minimalist-style-modern-art_348404-495.jpg?w=740',
    '8 stories in total',
  ),
  ReadingListItem(
    'My first ever thrilling stories',
    'I am not a typical person who enjoys reading something thrilling but this one made me addict.',
    'https://preview.redd.it/jaehyun-nct-you-will-die-in-6-hours-movie-teaser-poster-v0-4uiabnluxfxc1.jpeg?width=1080&crop=smart&auto=webp&s=9975d8f2bac866282424eecad7cb271510029d9d',
    '1 story in total',
  ),
  ReadingListItem(
    'My favorite comedy stories',
    'The quirky characters and funny plot twists make it an enjoyable and turning read.',
    'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQdPzI9Z5oX62T89uk3DNa6W3rp-lE3nMd0CZMLvaM2oe_QEiSd',
    '5 stories in total',
  ),
  ReadingListItem(
    'My favorite Sci-Fi stories',
    'The intriguing exploration of gender and culture on a distant planet that makes it a unique and compelling read.',
    'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR5YpWlos-wxTdsHAPU6WyFuhBCdASe1XbGDiFu0fkgatthuYLg',
    '3 stories in total',
  ),
  ReadingListItem(
    'My favorite Sci-Fi stories',
    'The intriguing exploration of gender and culture on a distant planet that makes it a unique and compelling read.',
    'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR5YpWlos-wxTdsHAPU6WyFuhBCdASe1XbGDiFu0fkgatthuYLg',
    '3 stories in total',
  ),
];
