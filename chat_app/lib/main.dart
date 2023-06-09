import 'package:chat_app/core/naviagtion/module.dart';
import 'package:chat_app/core/theme/dark_theme.dart';
import 'package:chat_app/core/theme/light_theme.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/l10n/l10n.dart';
import 'package:chat_app/moduls/add_frinds/statemangment/cubit/add_frind_cubit.dart';
import 'package:chat_app/moduls/auth/statemangment/cubit/auth_cubit.dart';
import 'package:chat_app/moduls/auth/views/login/login_screen.dart';
import 'package:chat_app/moduls/chat/statemangment/cubit/chat_cubit.dart';
import 'package:chat_app/my_observer.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
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
              BlocProvider<AddFrindCubit>(
                create: (_) => AddFrindCubit(),
              ),
              BlocProvider<ChatCubit>(
                create: (_) => ChatCubit(),
              ),
            ],
            child: MaterialApp.router(
              title: 'Flutter Demo',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.system,
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
