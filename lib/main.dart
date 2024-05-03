import'package:flutter/material.dart';
import 'package:e_commerce_exam/Application/CartScreen.dart';
import 'package:e_commerce_exam/Application/HomeScreen.dart';

import 'Application/DetailScreen.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DetailScreen(),
      initialRoute: '/home',
      routes: {
        '/home':(context)=>HomeScreen(),
        '/detail':(context)=>DetailScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
