import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(
        home: HomePage(),
      ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text(
            'Hello World!',
        style: TextStyle(
          fontSize: 38
        ),
        ),
      ),
    );
  }
}
