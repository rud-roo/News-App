import 'package:flutter/material.dart';
import 'package:news_app/gridscreen.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/screens/all.dart';
import 'package:news_app/screens/business.dart';
import 'package:news_app/screens/details.dart';
import 'package:news_app/screens/entertainment.dart';
import 'package:news_app/screens/sports.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NewsApp",

      initialRoute: HomeScreen.path,
      routes: {
        GridScreen.path: (ctx)=> GridScreen(),
        HomeScreen.path: (ctx)=> HomeScreen(),
        All.path: (ctx)=> All(),
        Sports.path: (ctx)=> Sports(),
        Business.path: (ctx)=> Business(),
        Entertainment.path: (ctx)=> Entertainment(),
        DetailScreen.path: (ctx)=> DetailScreen(),
      },
    );
  }
}