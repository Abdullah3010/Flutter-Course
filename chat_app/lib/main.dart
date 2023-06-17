import 'package:chat_app/core/naviagtion/module.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/l10n/l10n.dart';
import 'package:chat_app/moduls/auth/statemangment/cubit/auth_cubit.dart';
import 'package:chat_app/moduls/auth/views/login/login_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthCubit>(
                create: (_) => AuthCubit(),
              ),
            ],
            child: MaterialApp.router(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
              routeInformationParser: Modular.routeInformationParser,
              routerDelegate: Modular.routerDelegate,
              supportedLocales: L10n.all,
              localizationsDelegates: L10n.localizationDelegates,
              locale: const Locale('en'),
              builder: (context, child) {
                return child ?? LoginScreen();
              },
            ),
          );
        });
  }
}
