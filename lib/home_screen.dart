import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuoteAppHome(),
    );
  }
}

class QuoteAppHome extends StatefulWidget {
  @override
  _QuoteAppHomeState createState() => _QuoteAppHomeState();
}

class _QuoteAppHomeState extends State<QuoteAppHome> {
  List<String> quotes = [
    "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
    "Believe you can and you're halfway there. -Theodore Roosevelt",
    "The future belongs to those who believe in the beauty of their dreams. -Eleanor Roosevelt",
    // Add more quotes as needed
  ];

  List<bool> favorites = List.generate(3, (index) => false); // Assume 3 initial quotes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote App'),
      ),
      body: Stack(
        children: [
          // Background Photo
          Image.asset(
            'assets/image/background - Copy.jpg', // Replace with the path to your image
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          ListView.builder(
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              String currentQuote = quotes[index];
              bool isFavorite = favorites[index];

              return ListTile(
                title: Text(
                  currentQuote,
                  style: TextStyle(color: Colors.black), // Set text color
                ),
                tileColor: Colors.black.withOpacity(0.5), // Add a transparent black background
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        // Add your logic for adding a quote
                        print("Add quote: $currentQuote");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: isFavorite ? Colors.red : null,
                      onPressed: () {
                        // Add your logic for marking/unmarking as favorite
                        setState(() {
                          favorites[index] = !isFavorite;
                        });
                        print("Mark/unmark as favorite: $currentQuote");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        // Add your logic for sharing the quote
                        print("Share quote: $currentQuote");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Add your logic for deleting the quote
                        setState(() {
                          quotes.removeAt(index);
                          favorites.removeAt(index);
                        });
                        print("Delete quote: $currentQuote");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        // Add your logic for navigating to the favorite quotes page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyFavoriteQuotePage(
                              favoriteQuotes: quotes.where((quote) {
                                int quoteIndex = quotes.indexOf(quote);
                                return favorites[quoteIndex];
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MyFavoriteQuotePage extends StatelessWidget {
  final List<String> favoriteQuotes;

  MyFavoriteQuotePage({required this.favoriteQuotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite Quotes'),
      ),
      body: Stack(
        children: [
          // Background Photo
          Image.asset(
            'assets/image/background - Copy.jpg', // Replace with the path to your image
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          favoriteQuotes.isEmpty
              ? Center(
            child: Text(
              'You have no favorite quotes yet.',
              style: TextStyle(color: Colors.black), // Set text color
            ),
          )
              : ListView.builder(
            itemCount: favoriteQuotes.length,
            itemBuilder: (context, index) {
              String favoriteQuote = favoriteQuotes[index];
              return ListTile(
                title: Text(
                  favoriteQuote,
                  style: TextStyle(color: Colors.black), // Set text color
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
