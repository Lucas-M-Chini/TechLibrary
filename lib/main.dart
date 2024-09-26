import 'package:flutter/material.dart';
import 'package:techlibrary/CadastroScreen.dart';
import 'package:techlibrary/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechLibrary',
      theme: ThemeData(
        primaryColor: Color(0xFF00E0FF),
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>HomeScreen(),
        '/cadastro':(context)=>CadastroScreen(),

      },
    );
  }
}