import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/firebase_options.dart';
import 'package:notification_app/repository/auth_reposository.dart';
import 'package:notification_app/screens/auth_screen.dart';
import 'package:notification_app/screens/home_screen.dart';
import 'package:notification_app/screens/login_screen.dart';
import 'package:notification_app/screens/signup_screen.dart';
import 'package:notification_app/screens/splash_screen.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/log_in/log_in_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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
        GoRoute(path: '/newEvent',builder: (context, state) => Text("")),
      ],
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          AuthBloc(authRepository: AuthRepository())
            ..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) => LogInBloc(authRepository: AuthRepository()),
        ),
      ],
      child: MaterialApp.router(
          title: 'Event Management App',
          theme: ThemeData(useMaterial3: true,brightness: Brightness.light),

          routerConfig: _router,
      ),
    );
  }
}
