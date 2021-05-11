import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_coffee/models/brew.dart';
import 'package:brew_coffee/screens/home/brew_tile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>>(context) ?? [];

    if(brews != null){
      brews.forEach((brew) {
        print(brew.name);
        print(brew.strength);
        print(brew.sugars);
      });

    }

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (content, index){
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
