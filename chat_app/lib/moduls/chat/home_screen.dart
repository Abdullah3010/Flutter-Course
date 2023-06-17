import 'package:chat_app/core/utils/constanct.dart';
import 'package:chat_app/core/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Constants constants = Modular.get<Constants>();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Text(constants.user?.name ?? ''),
          Text(constants.user?.email ?? ''),
          Text(constants.user?.phone ?? ''),
          Text(constants.user?.password ?? ''),
          Text(constants.user?.uid ?? ''),
          Text(constants.user?.image ?? ''),
          MyButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            text: 'sign out',
          ),
        ],
      ),
    ));
  }
}
