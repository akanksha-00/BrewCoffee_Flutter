import 'package:brew_coffee/screens/home/settings_form.dart';
import 'package:brew_coffee/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_coffee/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_coffee/screens/home/brew_list.dart';
import 'package:brew_coffee/models/brew.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew coffee'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout')),
            FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('Settings')
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/coffeeBeans.jpg'),
              fit: BoxFit.cover
            )
          ),
            child: BrewList()
        ),
      ),
    );
  }
}
