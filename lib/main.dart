import 'package:brew_crew/modals/user.dart';
import 'package:brew_crew/screens/authenticate/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      // Stream provider "WRAPS" this up with the user Function <Stream> one
      // and gives value weather user is signed in or not

      // NOW EVERY CHILD CAN ACCESS THE DATA PROVIDED BY THE STREAM

      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
