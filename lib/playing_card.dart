import 'dart:ffi';

import 'package:flutter/material.dart';
import 'bordered_icon.dart';
import 'text_with_background.dart';

const double cardWidth = 300;
const double heightWidthRatio = 1.36;
const double cardHeight = cardWidth * heightWidthRatio;

class PlayingCard extends StatelessWidget {
  final String heroName;
  final List<String> attributes;
  final List<String> abilities;
  final int health;
  final int speed;
  final int attack;
  final int defense;
  final int intelligence;
  final int extraStat; // star stat in the template
  final String skill1;
  final String skill2;
  final String skill3;

  PlayingCard(
      {required this.heroName,
      required this.attributes,
      required this.abilities,
      required this.health,
      required this.speed,
      required this.attack,
      required this.defense,
      required this.intelligence,
      required this.extraStat,
      required this.skill1,
      required this.skill2,
      required this.skill3});

  @override
  Widget build(BuildContext context) {
    List<String> attributeStrings = [
      '⚔ $attack',
      '⛨ $defense',
      '🧠 $intelligence',
      '★ $extraStat'
    ];
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 227, 227, 227),
        // borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Stack(
        children: [
          Positioned(
              left: 0,
              top: 0,
              child: Text(
                heroName,
                style: const TextStyle(fontSize: 20.0),
              )),
          Positioned(
            left: 0,
            top: cardHeight / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Left-align children
              children: [
                // Dynamically generated Text widgets
                ...attributes.map((String item) {
                  return TextWithBackground(
                      text: item,
                      backgroundColor: const Color.fromARGB(255, 117, 36, 39),
                      fontSize: 16.0,
                      width: 100);
                }).toList(),

                // Dynamically generated Text widgets
                ...abilities.map((String ability) {
                  return TextWithBackground(
                    text: ability,
                    backgroundColor: const Color.fromARGB(255, 153, 100, 87),
                    fontSize: 16.0,
                    width: 230,
                  );
                }).toList(),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment:
                  CrossAxisAlignment.end, // Right-align children
              children: [
                Text(
                  "♥" * health,
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  '🪽' * speed,
                  style: const TextStyle(fontSize: 20.0),
                ),
                ...attributeStrings.map((String str) {
                  return BorderedIcon(
                    text: str,
                    borderColor: Colors.blue,
                    width: 40,
                    fontSize: 20.0,
                  );
                }).toList(),
                Text(
                  skill1,
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  skill2,
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  skill3,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
