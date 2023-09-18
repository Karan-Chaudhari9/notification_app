import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
      body: Center(
        child: Column(
          children: [
            RiveAnimation.network("https://public.rive.app/community/runtime-files/809-1634-rocket-demo.riv")
          ],
        ),
      )
    );
  }
}
