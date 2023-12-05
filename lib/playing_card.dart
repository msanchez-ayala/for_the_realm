import 'dart:ffi';

import 'package:flutter/material.dart';
import 'bordered_icon.dart';
import 'text_with_background.dart';

const double cardWidth = 310;
const double heightWidthRatio = 1.36;
const double cardHeight = cardWidth * heightWidthRatio;

class IconWithData {
  final String text;
  final int value;

  IconWithData({
    required this.text,
    required this.value,
  });
}

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
    const Color primaryRed = Color.fromARGB(255, 117, 36, 39);
    const Color primaryBlue = Color.fromARGB(255, 16, 16, 141);
    List<String> topRightTexts = ['Aff', 'Aln'];
    List<IconWithData> stats = [
      IconWithData(text: '⚔', value: attack),
      IconWithData(text: '⛨', value: defense),
      IconWithData(text: '🧠', value: intelligence),
    ];
    List<IconWithData> skills = [
      IconWithData(text: skill1, value: attack),
      IconWithData(text: skill2, value: defense),
      IconWithData(text: skill3, value: intelligence),
    ];
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 245, 245),
        // borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Stack(
        children: [
          Positioned(
              left: 20, // TODO: position dynamically instead of hacking
              top: 7,
              child: Text(
                heroName,
                style: const TextStyle(
                    fontSize: 22.0,
                    color: primaryRed,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
            left: 0,
            top: cardHeight / 2,
            child: Container(
              // use this widget to force Column to take up `height`
              height: cardHeight / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Left-align children
                children: [
                  // Dynamically generated Text widgets
                  ...attributes.map((String item) {
                    return TextWithBackground(
                        text: item,
                        backgroundColor: primaryRed,
                        fontSize: 14.0,
                        width: 100);
                  }).toList(),

                  // Dynamically generated Text widgets
                  ...abilities.map((String ability) {
                    return TextWithBackground(
                      text: ability,
                      backgroundColor: const Color.fromARGB(255, 184, 113, 96),
                      fontSize: 14.0,
                      width: 230,
                    );
                  }).toList(),
                ],
              ),
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
                Row(
                  children: [
                    ...topRightTexts.map((String text) {
                      return Container(
                          width: 65,
                          color: primaryRed,
                          alignment: Alignment.center,
                          child: Text(text,
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white)));
                    }).toList(),
                  ],
                ),
                Text(
                  "♥" * health,
                  style: const TextStyle(fontSize: 20.0, color: primaryRed),
                ),
                Text(
                  '🪽' * speed,
                  style: const TextStyle(fontSize: 20.0),
                ),
                ...stats.map((IconWithData stat) {
                  return BorderedIcon(
                    text: stat.text,
                    value: stat.value,
                    borderColor: primaryRed,
                    width: 28,
                  );
                }).toList(),
                BorderedIcon(
                  text: '★',
                  value: extraStat,
                  borderColor: Colors.purple,
                  width: 28,
                ),
                ...skills.map((IconWithData skill) {
                  return BorderedIcon(
                    text: skill.text,
                    value: skill.value,
                    borderColor: primaryBlue,
                    width: 42,
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
