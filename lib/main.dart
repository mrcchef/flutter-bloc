import 'package:flutter/material.dart';
import 'package:football_players/repositories/player_repositories.dart';
import 'package:football_players/widget/home_page.dart';

void main() {
  PlayerRepositories playerRepositories = PlayerRepositoriesImpl();
  runApp(MyApp(playerRepositories: playerRepositories));
}

class MyApp extends StatelessWidget {
  final PlayerRepositories playerRepositories;
  MyApp({this.playerRepositories});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FootBall Players',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      home: HomePage(
        playerRepositories: playerRepositories,
      ),
    );
  }
}
