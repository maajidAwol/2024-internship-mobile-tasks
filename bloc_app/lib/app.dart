import 'package:bloc_app/view/timer_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bloc timer',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color.fromARGB(72,74, 126, 1)
        )
      ),
      home: const TimerPage()
    );
  }
}

