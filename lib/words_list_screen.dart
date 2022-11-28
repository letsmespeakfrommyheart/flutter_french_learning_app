import 'package:flutter/material.dart';
import 'package:flutter_french_learning_app/french_word.dart';

class WordsListScreen extends StatelessWidget {
  final FrenchWord word;

  const WordsListScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(word.image)),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((word.word),
                    style: const TextStyle(
                        fontSize: 25, fontStyle: FontStyle.italic)),
                const Text((' - '),
                    style:
                        TextStyle(fontSize: 25, fontStyle: FontStyle.italic)),
                Text((word.translation),
                    style: const TextStyle(
                        fontSize: 25, fontStyle: FontStyle.italic)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
