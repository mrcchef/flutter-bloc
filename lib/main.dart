import 'package:flutter/material.dart';
import 'package:football_players/repositories/player_repositories.dart';
import 'package:football_players/screens/advance_search.dart';
import 'package:football_players/screens/home_page.dart';
import 'package:football_players/theme/themes.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'FootBall Players',
      theme: ThemeData(
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
          elevation: 0.0,
          textTheme: TextTheme(title: appBarTextStyle),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: HomePage(
        playerRepositories: playerRepositories,
      ),
      routes: {
        AdvanceSearch.routeName: (context) => AdvanceSearch(),
      },
    );
  }
}
