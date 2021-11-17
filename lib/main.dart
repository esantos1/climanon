import 'package:climanon/screens/home.dart';
import 'package:climanon/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      title: 'Climanon',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      //escolhe o tema de acordo com o tema do sistema
      themeMode: ThemeMode.system,
    );
  }
}
