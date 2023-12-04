import 'package:flutter/material.dart';

const double cardWidth = 300;
const double heightWidthRatio = 1.36;
const double cardHeight = cardWidth * heightWidthRatio;

class PlayingCard extends StatelessWidget {
  final String rank;
  final String suit;
  final Color cardColor;

  PlayingCard(
      {required this.rank, required this.suit, required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: cardColor,
        // borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            rank,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            suit,
            style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
