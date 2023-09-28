
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/splash_screen.dart';

class AppRouter{
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(path: '/base', builder: (context, state) => MyApp()),
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
      GoRoute(path: '/auth', builder: (context, state) => AuthScreen()),
      GoRoute(path: '/login',builder: (context, state) => LogInScreen()),
      GoRoute(path: '/register',builder: (context, state) => RegisterScreen()),
    ],
  );
}