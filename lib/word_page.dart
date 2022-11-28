import 'package:flutter/material.dart';
import 'package:flutter_french_learning_app/french_word.dart';
import 'package:flutter_french_learning_app/words_list_screen.dart';

class WordPage extends Page {
  final FrenchWord word;

  WordPage({required this.word}) : super(key: ValueKey(word));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return WordsListScreen(
          word: word,
        );
      },
    );
  }
}
