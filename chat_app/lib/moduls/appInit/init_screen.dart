import 'package:chat_app/core/naviagtion/route_names.dart';
import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/moduls/auth/statemangment/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppInitScreen extends StatefulWidget {
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        BlocProvider.of<AuthCubit>(context).getUserData(user.uid).then((value) {
          Modular.to.navigate(AppRoute.chat.home);
        });
      } else {
        final constant = Modular.get<Constants>();
        constant.user = null;
        Modular.to.navigate(AppRoute.auth.login);
      }
    });
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
