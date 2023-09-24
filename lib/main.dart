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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => SplashScreen(),
      routes: <RouteBase>[
        GoRoute(
            path: '/home',
            builder: (BuildContext context, GoRouterState state) =>
                HomeScreen()),
        GoRoute(
            path: '/login',
            builder: (BuildContext context, GoRouterState state) =>
                LogInScreen()),
        GoRoute(
            path: '/register',
            builder: (BuildContext context, GoRouterState state) =>
                RegisterScreenView()),
        GoRoute(
            path: '/auth',
            builder: (BuildContext context, GoRouterState state) =>
                AuthScreen()),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(authRepository: AuthRepository())..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) => LogInBloc(authRepository: AuthRepository()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Event Management App',
        theme: ThemeData(useMaterial3: true),
        routerConfig: router,
      ),
    );
  }
}
