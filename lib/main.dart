import 'package:flutter/material.dart';
import 'package:flutter_french_learning_app/french_word.dart';
import 'package:flutter_french_learning_app/word_page.dart';

void main() {
  runApp(const FrenchApp());
}

class FrenchApp extends StatefulWidget {
  const FrenchApp({super.key});

  @override
  State<FrenchApp> createState() => _MyAppState();
}

class _MyAppState extends State<FrenchApp> {
  FrenchWord? _selectedWord;

  List<FrenchWord> word = [
    FrenchWord('un échecs', 'шахматы', 'assets/images/шахматы.jpg'),
    FrenchWord('une élève', 'ученик', 'assets/images/ученик.jpg'),
    FrenchWord('un marché', 'рынок', 'assets/images/рынок.jpg'),
    FrenchWord('un gens', 'люди', 'assets/images/люди.png'),
    FrenchWord('une herbe', 'трава', 'assets/images/трава.jpg'),
    FrenchWord('dormir', 'спать, заснуть', 'assets/images/спать.jpg'),
    FrenchWord('définir', 'определять', 'assets/images/определять.jpeg'),
    FrenchWord('choisir', 'выбирать', 'assets/images/выбирать.jpg'),
    FrenchWord('règlementer', 'регулировать', 'assets/images/регулировать.jpg'),
    FrenchWord('coûter', 'стоить', 'assets/images/стоить.jpg'),
    FrenchWord('utile', 'полезный', 'assets/images/полезный.png'),
    FrenchWord('prochain', 'следующий', 'assets/images/следующий.jpg'),
    FrenchWord('bête', 'глупый', 'assets/images/глупый.jpg'),
    FrenchWord('faux', 'неправильный, ложный', 'assets/images/ложный.jpg'),
    FrenchWord('strictement', 'тщательно', 'assets/images/тщательно.png')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Navigator(
          pages: [
            MaterialPage(
                key: const ValueKey('word'),
                child:
                    WordsListScreen(words: word, onTapped: _handleWordTapped)),
            if (_selectedWord != null)
              WordPage(
                word: _selectedWord!,
              ),
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }
            setState(() {
              _selectedWord = null;
            });

            return true;
          },
        ));
  }

  void _handleWordTapped(FrenchWord word) {
    setState(() {
      _selectedWord = word;
    });
  }
}

class WordsListScreen extends StatelessWidget {
  final List<FrenchWord> words;
  final ValueChanged<FrenchWord> onTapped;

  WordsListScreen({
    required this.words,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          'Choose a word to translate',
        ),
      ),
      body: ListView(
        children: [
          for (var word in words)
            ListTile(
              title: Text(word.word),
              onTap: () => onTapped(word),
            )
        ],
      ),
    );
  }
}
