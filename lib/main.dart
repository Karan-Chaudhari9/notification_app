import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/bloc/register/register_bloc.dart';
import 'package:notification_app/config/route.dart';
import 'package:notification_app/firebase_options.dart';
import 'package:notification_app/repository/auth_reposository.dart';
import 'package:notification_app/manager/event_manager.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/log_in/log_in_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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
              AuthBloc(authRepository: AuthRepository())..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) => LogInBloc(authRepository: AuthRepository()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(authRepository: AuthRepository()),
        ),
      ],
      child: MaterialApp.router(
        showSemanticsDebugger: false,
        title: 'Event Management App',
        theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
