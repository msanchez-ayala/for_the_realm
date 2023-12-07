import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'playing_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: primaryRed),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'For the Realm'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static PlayingCard buildPlayingCard(int index) {
    return PlayingCard(
        heroName: 'Blood Priest $index',
        attributes: const ['Intimidate', 'Ruthless'],
        abilities: const [
          'Feed: -1 ♥ to Blood\nPriest, +2 ⚔ | ⛨ to any mate',
          'Leech: -1 ♥ to any foe,\n+1 ♥ to Blood Priest'
        ],
        health: 5,
        speed: 4,
        attack: 4,
        defense: 4,
        intelligence: 6,
        extraStat: 10,
        skill1: 'S1',
        skill2: 'S2',
        skill3: 'S3');
  }

  @override
  Widget build(BuildContext context) {
    List<PlayingCard> cards =
        List.generate(10, (index) => buildPlayingCard(index));
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: cardHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return cards[index];
                },
                separatorBuilder: (context, index) {
                  return Container(width: 12.0, color: Colors.grey);
                },
                physics: const ScrollPhysics(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
