import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/brew.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:flutter_firebase/shared/constants.dart';
import 'package:provider/provider.dart';

import 'brew-list.dart';
import 'settings-form.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(
        context : context,
        builder : (context) 
        => Container (
          padding : EdgeInsets.symmetric(
            vertical : 20.0,
            horizontal : 60.0,
          ),
          child : SettingsForm(),
        ));
    }

    return StreamProvider<List<Brew>>.value(
      value : DatabaseService().brews,
      child : Scaffold(
        backgroundColor : Colors.brown[50],
        appBar : AppBar(
          title : Text('Coffee Club'),
          backgroundColor : appBarBackgroundColor,
          elevation : 0.0,
          actions : [
            FlatButton.icon(
              icon : Icon(
                Icons.person, 
                color: Colors.white,
              ),
              label : Text('logout', style: TextStyle(color: Colors.white)),
              onPressed : () async {
                await _auth.signOut();
              }
            ),
            FlatButton.icon(
              icon : Icon(
                Icons.settings, 
                color: Colors.white,
              ),
              label : Text('Update', style: TextStyle(color: Colors.white)),
              onPressed : () => _showSettingsPanel(),
            ),
          ],
        ),
        body : Container(
          child: BrewList(),
          decoration : backgroundDecoration,
        ),
      ),
    );
  }
}