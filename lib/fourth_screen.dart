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
            tabs: [
              Tab(text: 'Your reads'),
              Tab(text: 'Your Reading List'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OfflineReadsView(),
            Center(
                child: Text(
                    'Your Reading List')), // Placeholder for the second tab
          ],
        ),
      ),
    );
  }
}

class OfflineReadsView extends StatelessWidget {
  const OfflineReadsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Your first row of widgets here (e.g., header)
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
        // Expanded widget to make GridView take the remaining space
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

class Book {
  final String title;
  final String author;
  final String imagePath;

  Book(this.title, this.author, this.imagePath);
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
            // Wrap the image with ClipRRect
            borderRadius:
                BorderRadius.circular(8.0), // Set desired corner radius
            child: Container(
              width: double.infinity,
              child: Image.network(
                book.imagePath,
                fit: BoxFit.cover,
                height: 100.0,
                alignment: Alignment.center,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text('Error loading image'));
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

// Example book list
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
