import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(
      const MaterialApp(
        home: HomePage(),
      ),
  );
}

<<<<<<< Updated upstream
class HomePage extends StatelessWidget {
  const HomePage({super.key});
=======
final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(path: '/base', builder: (context, state) => MyApp()),
        GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
        GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
        GoRoute(path: '/auth', builder: (context, state) => AuthScreen()),
        GoRoute(path: '/login',builder: (context, state) => LogInScreen()),
        GoRoute(path: '/register',builder: (context, state) => RegisterScreenView()),
      ],
);
>>>>>>> Stashed changes

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
