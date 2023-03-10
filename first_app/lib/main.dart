import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();

    return MaterialApp(
      //title: 'Gamer Tag Generator',
      home: RandomWords(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color(0xFFB71C1C),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RandomWordsState();
  }
}

class _RandomWordsState extends State<StatefulWidget> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gamer Tag Generator!'),
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: const Icon(Icons.list),
            tooltip: "Saved Suggestions",
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(11));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
          semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
        ),
        onTap: () {
          setState(() {
            if (alreadySaved)
              _saved.remove(pair);
            else
              _saved.add(pair);
          });
        });
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      final tiles = _saved.map(
        (pair) {
          return ListTile(
            title: Text(
              pair.asCamelCase,
              style: _biggerFont,
            ),
          );
        },
      );
      final divided = tiles.isNotEmpty
          ? ListTile.divideTiles(context: context, tiles: tiles).toList()
          : <Widget>[];
      return Scaffold(
        appBar: AppBar(
          title: const Text('Saved Suggestions'),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }
}
