import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            'assets/image/background - Copy.png', // Replace with the path to your image
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          favoriteQuotes.isEmpty
              ? Center(
            child: Text(
              'You have no favorite quotes yet.',
              style: TextStyle(color: Colors.white), // Set text color
            ),
          )
              : ListView.builder(
            itemCount: favoriteQuotes.length,
            itemBuilder: (context, index) {
              String favoriteQuote = favoriteQuotes[index];
              return ListTile(
                title: Text(
                  favoriteQuote,
                  style: TextStyle(color: Colors.white), // Set text color
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}