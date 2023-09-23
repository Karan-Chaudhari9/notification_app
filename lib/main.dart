import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/repository/auth_reposository.dart';
import 'package:notification_app/screens/splash_screen.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/log_in/log_in_bloc.dart';
import 'config/AppRouter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

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
      child: MaterialApp(
        title: 'Event Management App',
        theme: ThemeData(useMaterial3: true),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
