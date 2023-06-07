import 'package:chat_app/core/naviagtion/module.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/l10n/l10n.dart';
import 'package:chat_app/moduls/auth/views/login/login_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      supportedLocales: L10n.all,
      localizationsDelegates: L10n.localizationDelegates,
      locale: const Locale('ar'),
      builder: (context, child) {
        return child ?? LoginScreen();
      },
    );
  }
}
