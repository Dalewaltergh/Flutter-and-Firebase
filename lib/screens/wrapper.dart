import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/userW.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserW>(context);
    print(user);

    // return either Home or Authenticate Widget
    if (user == null) 
      return Authenticate();
    else return Home();
  }
}